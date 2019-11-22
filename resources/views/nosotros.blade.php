@extends('layouts.app')

@section('content')
<br><br><br><br>
<div class="page-blog-details section-padding--lg bg--white">
    <div class="container">
        <div class="row">
        <div class="col-lg-2 col-2"></div>
            <div class="col-lg-8 col-8">
                <div class="blog-details content">
                    <article class="blog-post-details">

                        @if(isset( $row ) && count($row) > 0)
                        <div class="post_wrapper">
                            <div class="post_header">
                                <h2>NOSOTROS</h2>
                            </div>
                            <div class="post_content">
                                <blockquote>{{ $row[0]->nosotros}}</blockquote>
                            </div>


                            <div class="post_header">
                                <h2>MISIÓN</h2>
                            </div>
                            <div class="post_content">
                                <blockquote>{{ $row[0]->mision}}</blockquote>
                            </div>

                            <div class="post_header">
                                <h2>VISIÓN</h2>
                            </div>
                            <div class="post_content">
                                <blockquote>{{ $row[0]->vision}}</blockquote>

                            </div>
                        </div>
                        @endif

                    <article>
                </div>
            </div>
        <div class="col-lg-2 col-2"></div>
        </div>
    </div>
</div>



@endsection
