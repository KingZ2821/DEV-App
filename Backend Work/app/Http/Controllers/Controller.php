<?php
namespace App\Http\Controllers;
use App\Models\Job;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Mail;
use App\Models\User;


 class Controller {
    use AuthorizesRequests;
    //

    public function index() {
        $job = Job::with('employer') -> latest()-> paginate(3);

    return view('jobs.index', [
        'jobs' => $job // Ensure 'Job' is properly capitalized and pluralized if needed
    ]);
    }

    public function create() {
        return view('jobs.create');

    }

    public function show (Job $job) {
        return view('jobs.show', ['job' => $job]);

    }

    public function store() {
        request()->validate([
            'Title' => ['required', 'min:3'],
            'Salary'=> ['required'],
        ]);
    
        $job = Job::create([
            'title' => request('Title'),
            'salary'=> request('Salary'),
            'employer_id' => 1
        ]);
        // return redirect('/jobs');
        //     Mail::to($job->employer->user)->send(
        //         new \App\Mail\JobPosted()
        //        );

    }

    public function edit(Job $job) {


        // if (Auth::guest()) {
        //     return redirect ('/login');
        // } Unused Due to Provider Foler Check Notes For Details. DAY 23

        //   Gate::authorize('edit-job', $job); Located In Providers

        return view('jobs.edit', ['job' => $job]);

    }

    public function update(Job $job) {
        request()->validate([
            'Title' => ['required', 'min:3'],
            'Salary'=> ['required'],
        ]);
        $job->update([
            'title' => request('Title'),
            'salary' => request('Salary')
        ]);
        return redirect('jobs/' . $job->id);
    }

    public function delete(Job $job) {
        $job ->delete();

        return redirect('/jobs');
    }
}
