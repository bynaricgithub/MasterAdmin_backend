<?php

namespace App\Jobs;

use App\Mail\SendGrievanceMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        try {
            $res = Mail::to($this->data['email'])->send(new SendGrievanceMail($this->data));
            Log::info("Email sent Success");
            Log::info($res);
        } catch (\Throwable $e) {
            Log::info($e);
            Log::info("error => " . $e->getMessage(),);
        }
    }
}
