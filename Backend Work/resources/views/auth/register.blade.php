<x-layout>
  <x-slot:heading>
    Register
</x-slot:heading>

  <form method="POST" action="/register">
      @csrf
      <div class="space-y-12">
          <div class="border-b border-gray-900/10 pb-12">
              <h2 class="text-base font-semibold text-gray-900">Profile</h2>
              <p class="mt-1 text-sm text-gray-600">This information will be displayed publicly so be careful what you share.</p>
      
              <div class="mt-10 grid grid-cols-1 gap-x-8 gap-y-8 sm:grid-cols-6">
                  <x-form-field>
                      <x-form-label for="first_name">First Name</x-form-label>
                      <div class="mt-2">
                          <x-form-input name="first_name" id="first_name"/>
                          <x-form-error name="first_name"/>
                      </div>
                  </x-form-field>
      
                  <div class="sm:col-span-4">
                      <x-form-label for="last_name">Last Name</x-form-label>
                      <div class="mt-2">
                              <x-form-input name="last_name" id="last_name"/>
                              <x-form-error name="last_name"/>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          
          <div class="sm:col-span-4">
            <x-form-label for="email">email</x-form-label>
            <div class="mt-2">
                    <x-form-input name="email" id="email"/>
                    <x-form-error name="email"/>
                </div>
            </div>
        </div>
      </div>

        <div>
          <x-form-label for="password">password</x-form-label>
          <div class="mt-2">
                  <x-form-input name="password" id="password"/>
                  <x-form-error name="password"/>
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