@extends('layouts.frontend')

@section('title', 'Home | My Website')
@section('meta_description', 'Welcome to the homepage of My Website, where we offer the best services.')
@section('meta_keywords', 'home, services, my website')

@section('og_title', 'Home | My Website')
@section('og_description', 'Discover the best services on our homepage.')
@section('og_image', asset('images/home-og-image.jpg'))
@section('og_url', url()->current())
@section('canonical', url()->current())

@section('content')
<h1>Welcome to Our Website</h1>
<p>This is the homepage. Here you can find all the details about our services.</p>

@endsection