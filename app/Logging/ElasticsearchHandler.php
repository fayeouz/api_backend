<?php

namespace App\Logging;

use Elastic\Elasticsearch\ClientBuilder;
use Monolog\Handler\AbstractProcessingHandler;
use Monolog\Logger;
use Monolog\LogRecord;

class ElasticsearchHandler extends AbstractProcessingHandler
{
    protected $client;
    protected $index;
    protected $enabled;

    public function __construct($level = Logger::DEBUG, bool $bubble = true)
    {
        parent::__construct($level, $bubble);

        // Vérifier si Elasticsearch est activé
        $this->enabled = filter_var(env('LOG_ELASTICSEARCH_ENABLED', false), FILTER_VALIDATE_BOOLEAN);

        if (!$this->enabled) {
            $this->client = null;
            return;
        }

        try {
            $this->client = ClientBuilder::create()
                ->setHosts(config('elasticsearch.hosts'))
                ->build();

            $this->index = config('elasticsearch.index_prefix') . '_logs';
        } catch (\Exception $e) {
            $this->client = null;
            $this->enabled = false;
        }
    }

    protected function write(LogRecord $record): void
    {
        // Ne rien faire si Elasticsearch est désactivé
        if (!$this->enabled || !$this->client) {
            return;
        }

        try {
            $this->client->index([
                'index' => $this->index . '_' . date('Y_m_d'),
                'body' => [
                    'message' => $record->message,
                    'level' => $record->level->getName(),
                    'level_name' => $record->level->getName(),
                    'channel' => $record->channel,
                    'context' => $record->context,
                    'extra' => $record->extra,
                    'datetime' => $record->datetime->format('Y-m-d H:i:s'),
                    'timestamp' => $record->datetime->getTimestamp(),
                ],
            ]);
        } catch (\Exception $e) {
            // Silently fail - don't break the application
        }
    }
}
