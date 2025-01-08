<x-layout>
    <x-slot:heading>
        Edit Job: {{$job -> title}}
    </x-slot:heading>

 <p>TODO </p>
 <!--
  This example requires some changes to your config:
  
  ```
  // tailwind.config.js
  module.exports = {
    // ...
    plugins: [
      // ...
      require('@tailwindcss/forms'),
    ],
  }
  ```
-->
<form class="max-w-4xl mx-auto" method="POST" action="/jobs/{{$job->id}}">
    @csrf
    @method('PATCH')
    <div class="space-y-12">
      <div class="border-b border-gray-900/10 pb-12">

  
        <div class="mt-10 grid grid-cols-1 gap-x-8 gap-y-8 sm:grid-cols-6">
          <div class="sm:col-span-4">
            <label for="Title" class="block text-sm font-medium text-gray-900">Title</label>
            <div class="mt-2">
              <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-indigo-600 sm:max-w-md">
                <input 
                type="text" 
                name="Title" 
                id="Title" 
                class="block flex-1 border-0 bg-transparent py-2 pl-2 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm" 
                placeholder="Title" 
                value="{{$job -> title}}">
              </div>
                @error('Title')
                  <p class="text-xs text-red-500 font-semibold"> {{$message}}</p>
                @enderror

            </div>
          </div>
  
          <div class="sm:col-span-4">
            <label for="Salary" class="block text-sm font-medium text-gray-900">Salary</label>
            <div class="mt-2">
              <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-indigo-600 sm:max-w-md">
                <input 
                type="text" 
                name="Salary" 
                id="Salary" 
                class="block flex-1 border-0 bg-transparent py-2 pl-2 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm" 
                placeholder="Salary"
                value="{{$job->salary}}">
              </div>
            </div>
          </div>
          {{-- <div>
              @if ($errors -> any()) 
                  <ul>
                  @foreach ($errors ->all() as $error )
                        <li> {{$error}} </li>
                  @endforeach
                  </ul>
              @endif
          </div> --}}
          
          <div class="mt-6 flex items-center justify-end gap-x-6">
            <div>
              <button form="delete-form" class="text-red-500 text-sm font-bold">Delete</button>
            </div>
            <div>
              <a href="/jobs/{{$job->id}}" class="text-sm font-semibold text-gray-900">Cancel</button>
            </div>
              <button type="submit" class="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600">Update</button>
          </div>
  </form>

  <form method="POST" action="/jobs/{{$job->id}}" id="delete-form" class="hidden">
    @csrf
    @method('DELETE')

  </form>
  

</x-layout>