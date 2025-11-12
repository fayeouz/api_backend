<?php

namespace App\Services;

use App\Models\Meeting;
use App\Models\Project;

class MeetingService
{
    protected $notificationService;

    public function __construct()
    {
        $this->notificationService = new NotificationService();
    }

    public function index()
    {
        return Meeting::with(['project', 'user'])->get();
    }

    public function show(string $id)
    {
        return Meeting::with(['project', 'user'])->findOrFail($id);
    }

    public function store(array $request)
    {
        // Créer le meeting
        $meeting = Meeting::create($request);

        // Récupérer le projet et ses membres
        $project = Project::with('users')->findOrFail($request['project_id']);

        // Récupérer l'organisateur du meeting
        $organizer = auth()->user();

        // Formater le type de meeting pour l'affichage
        $meetingType = $this->formatMeetingType($meeting->type);

        // Envoyer une notification à tous les membres du projet
        foreach ($project->users as $user) {
            // Ne pas envoyer de notification à l'organisateur lui-même
            if ($user->id !== $meeting->user_id) {
                $this->notificationService->create(
                    $user->id,
                    'Nouvelle réunion programmée',
                    "Un nouveau {$meetingType} réunion intitulée '{$meeting->title}' a été programmé pour le projet '{$project->name}' par {$organizer->name}. Duration: {$meeting->duration} minutes."
                );
            }
        }

        return $meeting->load(['project', 'user']);
    }

    public function update(array $request, string $id)
    {
        $meeting = Meeting::findOrFail($id);
        $meeting->update($request);

        return $meeting->load(['project', 'user']);
    }

    public function destroy(string $id)
    {
        $meeting = Meeting::findOrFail($id);
        $meeting->delete();

        return response()->json(['message' => 'Meeting supprimé avec succès'], 200);
    }

    /**
     * Récupérer tous les meetings d'un projet spécifique
     */
    public function getMeetingsByProject(string $projectId)
    {
        return Meeting::where('project_id', $projectId)
            ->with(['user'])
            ->orderBy('created_at', 'desc')
            ->get();
    }

    /**
     * Récupérer tous les meetings organisés par un utilisateur
     */
    public function getMeetingsByUser(string $userId)
    {
        return Meeting::where('user_id', $userId)
            ->with(['project'])
            ->orderBy('created_at', 'desc')
            ->get();
    }

    /**
     * Récupérer les statistiques des meetings pour un projet
     */
    public function getProjectMeetingStats(string $projectId)
    {
        $meetings = Meeting::where('project_id', $projectId)->get();

        $stats = [
            'total_meetings' => $meetings->count(),
            'by_type' => [
                'daily_standup' => $meetings->where('type', 'daily_standup')->count(),
                'sprint_planning' => $meetings->where('type', 'sprint_planning')->count(),
                'sprint_review' => $meetings->where('type', 'sprint_review')->count(),
                'sprint_retrospective' => $meetings->where('type', 'sprint_retrospective')->count(),
                'backlog_refinement' => $meetings->where('type', 'backlog_refinement')->count(),
            ],
            'total_duration' => $meetings->sum('duration'),
            'average_duration' => $meetings->count() > 0
                ? round($meetings->avg('duration'), 2)
                : 0,
        ];

        return $stats;
    }

    /**
     * Récupérer les meetings d'un utilisateur authentifié pour ses projets
     */
    public function getMyMeetings()
    {
        $userId = auth()->id();

        // Récupérer les IDs des projets auxquels l'utilisateur participe
        $projectIds = Project::whereHas('users', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        })->pluck('id');

        // Récupérer tous les meetings de ces projets
        return Meeting::whereIn('project_id', $projectIds)
            ->orWhere('user_id', $userId)
            ->with(['project', 'user'])
            ->orderBy('created_at', 'desc')
            ->get();
    }

    /**
     * Formater le type de meeting pour l'affichage dans les notifications
     */
    private function formatMeetingType(string $type): string
    {
        $types = [
            'daily_standup' => 'Daily Standup',
            'sprint_planning' => 'Sprint Planning',
            'sprint_review' => 'Sprint Review',
            'sprint_retrospective' => 'Sprint Retrospective',
            'backlog_refinement' => 'Backlog Refinement',
        ];

        return $types[$type] ?? $type;
    }
}
