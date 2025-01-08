
<!-- $Attributes Navtag -->

<!-- When passing in attributes for layout using $attributes
 we must remember that we're passing in the attribute, so href tag must still be located
 within the layout page in order for it to apply. 

-->

{{-- Using type can allow us to just place into the layout page a preset, whenever we call the x-navlink, to render what we have it
already set to. meaning in the layout page I can do type == 'button' forcing a preset of button. 
--}}

@props(['active' => "false", 'type' => 'a'])

@if ($type == 'a')
    <a class= "{{$active ? "bg-gray-900 text-white" :" text-gray-300 hover:bg-gray-700 hover:text-white"}}  rounded-md px-3 py-2 text-sm font-medium" 
    aria-current="{{$active ? 'page' : 'false'}}" {{$attributes}}
    >{{ $slot }}</a>
    
@elseif ($type == 'button')
   
   <button
    class= "{{$active ? "bg-gray-900 text-white" :" text-gray-300 hover:bg-gray-700 hover:text-white"}}  rounded-md px-3 py-2 text-sm font-medium" 
    aria-current="{{$active ? 'page' : 'false'}}" {{$attributes}}
    >{{ $slot }}</button>
@endif


