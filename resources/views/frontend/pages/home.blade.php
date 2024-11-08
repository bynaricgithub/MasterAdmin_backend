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

<div class="container">

    <div class="row">

        <div class="col-xl-12 col-xs-12">
            @include('frontend.components.slider')

            <div class="honSlider">
                <div class="row justify-content-center">
                    <div class="col-lg-3 col-sm-3 col-xs-6 text-center">
                        <img src="{{ asset('images/honble/dr-vinod.png') }}" alt="Dr. Vinod Mohitkar"
                            class="img-fluid img-thumbnail" />
                        <h4>Dr. Vinod Mohitkar</h4>
                        <p>Hon'ble Director Technical Education</p>
                    </div>
                    <div class="col-lg-3 col-sm-3 col-xs-6 text-center">
                        <img src="{{ asset('images/honble/dr-jadhav.png') }}" alt="Dr. D.V. Jadhav"
                            class="img-fluid img-thumbnail" />
                        <h4>Dr. D.V. Jadhav</h4>
                        <p>Joint Director, Regional Office Pune</p>
                    </div>
                    <div class="col-lg-3 col-sm-3 col-xs-6 text-center">
                        <img src="{{ asset('images/honble/dr-sonaje.jpeg') }}" alt="Capt. (Dr.) N.P. Sonaje"
                            class="img-fluid img-thumbnail" />
                        <h4>Capt. (Dr.) N.P. Sonaje</h3>
                            <p>Principal</p>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<div class="container mt-4">

    <div class="row">
        <div class="col-xl-8 col-sm-8 col-xs-12">
            <div class="welcomeNote">
                <h1>Welcome to Government Polytechnic, Kolhapur</h1>
                <p>Government Polytechnic, Kolhapur was established in 1961 with Civil Engineering and Mechanical
                    Engineering Diploma Programmer. Started in a small rented building, the Institute was soon
                    Shifted
                    to its independent campus of about 12 hectors covering academic building and hostels.</p>

                <p>Institute has the privilege of being the First Academically Autonomous Government Polytechnic in
                    the
                    state.</p>

                <p>At present, the Institute offers Diploma programmer in Civil Engineering, Mechanical Engineering,
                    Electrical Engineering, Industrial Electronics, Electronics and Telecommunication, Information
                    Technology, Metallurgy, Sugar Manufacturing.</p>

                <p>The Being rich with faculty of high qualifications, modernized laboratories and infrastructure,
                    the
                    Institute has progressed serving the industry and society. The alumni either proceed for higher
                    education or get employed in renowned industries through regular campus interviews organized by
                    the
                    Training and Placement Cell of the Institute.</p>

                <p>As a National level appreciation of education of the Institute, four programmer were awarded 3
                    years
                    accreditation by National Board of Accreditation (NBA), New Delhi in December 2003. Committed to
                    the
                    noble mission of developing technicians of high standards of excellence, the Institute is
                    crossing
                    broader and newer horizons of progress keeping pace with the changing global world.</p>

                <h2>Vision</h2>
                <p>Institute of high recognition to develop competent technicians for quality professional services
                    and
                    entrepreneurship to cater the needs of industry and society.</p>

                <h2>Mission</h2>
                <ul>
                    <li>To educate and train in multi disciplinary multi-level programs to develop competent
                        technicians
                        and skilled manpower for industrial needs</li>
                    <li>To ensure employability, encourage entrepreneurship, promote lifelong learning</li>
                    <li>To inculcate in students the qualities of a good citizen at individual, social and
                        professional
                        level</li>
                    <li>To provide quality management system with focus on effective student-centric education and
                        high
                        recognition</li>
                </ul>

            </div>
        </div>
        <div class="col-xl-4 col-sm-4 col-xs-12">
            @include('frontend.components.noticeboard')
            @include('frontend.components.videosection')
        </div>
        <div class="col-lg-12">
            @include('frontend.components.logoCarousel')
        </div>
    </div>

</div>

@endsection