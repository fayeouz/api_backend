<?php

namespace App\Http\Controllers;

use App\Http\Requests\MeetingRequest;
use App\Services\MeetingService;
use App\Services\ElasticsearchService;
use Illuminate\Support\Facades\Log;

class MeetingController extends Controller
{
    protected $meetingService;
    protected $elasticsearchService;

    public function __construct(ElasticsearchService $elasticsearchService)
    {
        $this->meetingService = new MeetingService();
        $this->elasticsearchService = $elasticsearchService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $this->elasticsearchService->logUserActivity('viewed_meetings_list');

            $meetings = $this->meetingService->index();

            $this->elasticsearchService->logMetric('meetings_list_viewed', [
                'meetings_count' => count($meetings),
            ]);

            return response()->json($meetings, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve meetings', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(MeetingRequest $request)
    {
        $startTime = microtime(true);

        try {
            $meeting = $this->meetingService->store($request->validated());

            $duration = (microtime(true) - $startTime) * 1000;

            // Log l'activité
            $this->elasticsearchService->logUserActivity('meeting_created', [
                'meeting_id' => $meeting->id,
                'title' => $meeting->title,
                'type' => $meeting->type,
                'project_id' => $meeting->project_id,
                'duration' => $meeting->duration,
            ]);

            // Log la métrique
            $this->elasticsearchService->logMetric('meeting_creation', [
                'meeting_id' => $meeting->id,
                'type' => $meeting->type,
                'project_id' => $meeting->project_id,
                'duration' => $meeting->duration,
                'created_by' => auth()->id(),
            ]);

            // Log la performance
            $this->elasticsearchService->logPerformance('create_meeting', $duration, [
                'meeting_id' => $meeting->id,
            ]);

            Log::info('Meeting created successfully', [
                'meeting_id' => $meeting->id,
                'type' => $meeting->type,
                'project_id' => $meeting->project_id,
                'user_id' => auth()->id(),
            ]);

            return response()->json([
                'message' => 'Meeting créé avec succès',
                'data' => $meeting
            ], 201);

        } catch (\Exception $e) {
            Log::error('Failed to create meeting', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
                'request_data' => $request->validated(),
            ]);

            $this->elasticsearchService->logMetric('meeting_creation', [
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
            $this->elasticsearchService->logUserActivity('viewed_meeting_details', [
                'meeting_id' => $id,
            ]);

            $meeting = $this->meetingService->show($id);

            return response()->json($meeting, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve meeting', [
                'meeting_id' => $id,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(MeetingRequest $request, string $id)
    {
        $startTime = microtime(true);

        try {
            $meeting = $this->meetingService->update($request->validated(), $id);

            $duration = (microtime(true) - $startTime) * 1000;

            $this->elasticsearchService->logUserActivity('meeting_updated', [
                'meeting_id' => $id,
                'title' => $meeting->title,
                'type' => $meeting->type,
            ]);

            $this->elasticsearchService->logMetric('meeting_update', [
                'meeting_id' => $id,
                'updated_by' => auth()->id(),
            ]);

            $this->elasticsearchService->logPerformance('update_meeting', $duration, [
                'meeting_id' => $id,
            ]);

            Log::info('Meeting updated successfully', [
                'meeting_id' => $id,
                'user_id' => auth()->id(),
            ]);

            return response()->json([
                'message' => 'Meeting mis à jour avec succès',
                'data' => $meeting
            ], 200);

        } catch (\Exception $e) {
            Log::error('Failed to update meeting', [
                'meeting_id' => $id,
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
            $meeting = $this->meetingService->show($id);

            $this->elasticsearchService->logUserActivity('meeting_deleted', [
                'meeting_id' => $id,
                'title' => $meeting->title ?? null,
                'type' => $meeting->type ?? null,
            ]);

            $this->elasticsearchService->logMetric('meeting_deletion', [
                'meeting_id' => $id,
                'deleted_by' => auth()->id(),
            ]);

            Log::warning('Meeting deleted', [
                'meeting_id' => $id,
                'user_id' => auth()->id(),
            ]);

            $this->meetingService->destroy($id);

            return response()->json(['message' => 'Meeting supprimé avec succès'], 200);

        } catch (\Exception $e) {
            Log::error('Failed to delete meeting', [
                'meeting_id' => $id,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Récupérer tous les meetings d'un projet spécifique
     */
    public function getMeetingsByProject(string $projectId)
    {
        try {
            $this->elasticsearchService->logUserActivity('viewed_project_meetings', [
                'project_id' => $projectId,
            ]);

            $meetings = $this->meetingService->getMeetingsByProject($projectId);

            $this->elasticsearchService->logMetric('project_meetings_viewed', [
                'project_id' => $projectId,
                'meetings_count' => count($meetings),
            ]);

            return response()->json($meetings, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve project meetings', [
                'project_id' => $projectId,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Récupérer tous les meetings organisés par un utilisateur
     */
    public function getMeetingsByUser(string $userId)
    {
        try {
            $this->elasticsearchService->logUserActivity('viewed_user_meetings', [
                'target_user_id' => $userId,
            ]);

            $meetings = $this->meetingService->getMeetingsByUser($userId);

            $this->elasticsearchService->logMetric('user_meetings_viewed', [
                'user_id' => $userId,
                'meetings_count' => count($meetings),
            ]);

            return response()->json($meetings, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve user meetings', [
                'user_id' => $userId,
                'error' => $e->getMessage(),
                'requested_by' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Récupérer les statistiques des meetings pour un projet
     */
    public function getProjectMeetingStats(string $projectId)
    {
        $startTime = microtime(true);

        try {
            $this->elasticsearchService->logUserActivity('viewed_project_meeting_stats', [
                'project_id' => $projectId,
            ]);

            $stats = $this->meetingService->getProjectMeetingStats($projectId);

            $duration = (microtime(true) - $startTime) * 1000;

            $this->elasticsearchService->logMetric('project_meeting_stats', [
                'project_id' => $projectId,
                'total_meetings' => $stats['total_meetings'],
                'total_duration' => $stats['total_duration'],
            ]);

            $this->elasticsearchService->logPerformance('get_project_meeting_stats', $duration, [
                'project_id' => $projectId,
            ]);

            Log::info('Project meeting stats retrieved', [
                'project_id' => $projectId,
                'user_id' => auth()->id(),
            ]);

            return response()->json($stats, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve project meeting stats', [
                'project_id' => $projectId,
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }

    /**
     * Récupérer les meetings de l'utilisateur authentifié pour tous ses projets
     */
    public function myMeetings()
    {
        $startTime = microtime(true);

        try {
            $this->elasticsearchService->logUserActivity('viewed_my_meetings');

            $meetings = $this->meetingService->getMyMeetings();

            $duration = (microtime(true) - $startTime) * 1000;

            $this->elasticsearchService->logMetric('my_meetings_viewed', [
                'user_id' => auth()->id(),
                'meetings_count' => count($meetings),
            ]);

            $this->elasticsearchService->logPerformance('get_my_meetings', $duration);

            return response()->json($meetings, 200);

        } catch (\Exception $e) {
            Log::error('Failed to retrieve user meetings', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id(),
            ]);
            throw $e;
        }
    }
}
