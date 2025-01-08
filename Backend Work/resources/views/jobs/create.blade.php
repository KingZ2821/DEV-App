<x-layout>
    <x-slot:heading>
        Create Job
    </x-slot:heading>

    <p>TODO</p>
    <!--
    This example requires some changes to your config:
    
    ```
    // [tailwind.config.js](http://_vscodecontentref_/0)
    module.exports = {
        // ...
        plugins: [
        // ...
        require('@tailwindcss/forms'),
        ],
    }
    ```
    -->
    <form class="max-w-4xl mx-auto" method="POST" action="/jobs">
        @csrf
        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold text-gray-900">Profile</h2>
                <p class="mt-1 text-sm text-gray-600">This information will be displayed publicly so be careful what you share.</p>
        
                <div class="mt-10 grid grid-cols-1 gap-x-8 gap-y-8 sm:grid-cols-6">
                    <x-form-field>
                        <x-form-label for="Title">Title</x-form-label>
                        <div class="mt-2">
                            <x-form-input name="Title" id="Title" placeholder="CEO"/>
                            <x-form-error name="Title"/>
                        </div>
                    </x-form-field>
        
                    <div class="sm:col-span-4">
                        <x-form-label for="Salary">Salary</x-form-label>
                        <div class="mt-2">
                                <x-form-input name="Salary" id="Salary" placeholder="$50000"/>
                                <x-form-error name="Salary"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mt-6 flex items-center justify-center gap-x-6">
            <button type="button" class="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600">Cancel</button>
            <x-form-button>Save</x-form-button>
          </div>
    </form>
</x-layout>