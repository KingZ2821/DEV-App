<?php

namespace App\Policies;

use App\Models\User;
use App\Models\job;
use Illuminate\Auth\Access\Response;

class Jobpolicy
{
    public function edit(User $user, Job $job)
    {
        return $job->employer->user->is($user);
    }
}
