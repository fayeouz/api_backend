<?php

namespace App\Http\Controllers;

use App\Http\Requests\TaskRequest;
use App\Http\Requests\Updatetaskstatusrequest;
use App\Services\TaskService;
use App\Services\ElasticsearchService;
use Illuminate\Support\Facades\Log;

class TaskController extends Controller
{
    protected $taskService;
    protected $elasticsearchService;

    public function __construct(ElasticsearchService $elasticsearchService)
    {
        $this->taskService = new TaskService();
        $this->elasticsearchService = $elasticsearchService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $this->elasticsearchService->logUserActivity('viewed_tasks_list');

            $tasks = $this->taskService->index();

            return response()->json($tasks, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve tasks', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TaskRequest $request)
    {
        $startTime = microtime(true);

        try {
            $task = $this->taskService->store($request->validated());

            $duration = (microtime(true) - $startTime) * 1000;

            // Log l'activité
            $this->elasticsearchService->logUserActivity('task_created', [
                'task_id' => $task->id,
                'task_title' => $task->title,
                'user_story_id' => $task->user_story_id,
                'assigned_to' => $task->assigned_to,
            ]);

            // Log la métrique d'assignation
            if ($task->assigned_to) {
                $this->elasticsearchService->logMetric('task_assignment', [
                    'task_id' => $task->id,
                    'assigned_to' => $task->assigned_to,
                    'assigned_by' => auth()->id(),
                ]);
            }

            // Log la performance
            $this->elasticsearchService->logPerformance('create_task', $duration, [
                'task_id' => $task->id,
            ]);

            Log::info('Task created successfully', [
                'task_id' => $task->id,
                'assigned_to' => $task->assigned_to,
                'created_by' => auth()->id(),
            ]);

            return response()->json($task, 201);

        } catch (\Exception $e) {
            Log::error('Failed to create task', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);

            $this->elasticsearchService->logMetric('task_creation', [
                'status' => 'failed',
                'error' => $e->getMessage(),
            ]);

            throw $e;
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $this->elasticsearchService->logUserActivity('viewed_task_details', [
                'task_id' => $id,
            ]);

            $task = $this->taskService->show($id);

            return response()->json($task, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve task', [
                'task_id' => $id,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateStatus(UpdateTaskStatusRequest $request, string $id)
    {
        $startTime = microtime(true);

        try {
            $oldTask = $this->taskService->show($id);

            // Mettre à jour uniquement le statut
            $task = $this->taskService->update([
                'status' => $request->validated()['status']
            ], $id);

            $duration = (microtime(true) - $startTime) * 1000;

            // Le statut a changé par définition
            $this->elasticsearchService->logUserActivity('task_status_updated', [
                'task_id' => $id,
                'task_title' => $task->title,
                'old_status' => $oldTask->status,
                'new_status' => $task->status,
                'via' => 'kanban',
            ]);

            // Log les métriques de progression
            $this->elasticsearchService->logMetric('task_status_change', [
                'task_id' => $id,
                'old_status' => $oldTask->status,
                'new_status' => $task->status,
                'user_id' => auth()->id(),
            ]);

            // Log spécial pour les tâches complétées
            if ($task->status === 'completed') {
                $this->elasticsearchService->logMetric('task_completed', [
                    'task_id' => $id,
                    'completed_by' => auth()->id(),
                    'assigned_to' => $task->assigned_to,
                ]);
            }

            $this->elasticsearchService->logPerformance('update_task_status', $duration, [
                'task_id' => $id,
            ]);

            Log::info('Task status updated via Kanban', [
                'task_id' => $id,
                'old_status' => $oldTask->status,
                'new_status' => $task->status,
                'user_id' => auth()->id(),
            ]);

            return response()->json($task, 200);

        } catch (\Exception $e) {
            Log::error('Failed to update task status', [
                'task_id' => $id,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $task = $this->taskService->show($id);

            $this->elasticsearchService->logUserActivity('task_deleted', [
                'task_id' => $id,
                'task_title' => $task->title ?? null,
            ]);

            $this->elasticsearchService->logMetric('task_deletion', [
                'task_id' => $id,
                'deleted_by' => auth()->id(),
            ]);

            Log::warning('Task deleted', [
                'task_id' => $id,
                'user_id' => auth()->id(),
            ]);

            $this->taskService->destroy($id);

            return response()->json(['message' => 'Tâche supprimée avec succès'], 200);

        } catch (\Exception $e) {
            Log::error('Failed to delete task', [
                'task_id' => $id,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Récupère les tâches et statistiques de l'utilisateur connecté
     */
    public function myTasks()
    {
        $startTime = microtime(true);

        try {
            $this->elasticsearchService->logUserActivity('viewed_my_tasks');

            $tasks = $this->taskService->getUserTasksAndStats();

            $duration = (microtime(true) - $startTime) * 1000;

            // Log les statistiques des tâches
            $this->elasticsearchService->logMetric('user_tasks_stats', [
                'user_id' => auth()->id(),
                'total_tasks' => $tasks['total_tasks'] ?? 0,
                'pending_tasks' => $tasks['pending_tasks'] ?? 0,
                'active_tasks' => $tasks['active_tasks'] ?? 0,
                'completed_tasks' => $tasks['completed_tasks'] ?? 0,
            ]);

            $this->elasticsearchService->logPerformance('get_my_tasks', $duration);

            return response()->json($tasks, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve user tasks', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }
}
