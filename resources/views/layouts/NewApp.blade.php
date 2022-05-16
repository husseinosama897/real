<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>kripton - Crypto Admin Dashboard </title>
    <!-- Favicon icon -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
	<link rel="stylesheet" href="{{asset('User/vendor/chartist/css/chartist.min.css')}}">
    <link href="{{asset('User/vendor/bootstrap-select/dist/css/bootstrap-select.min.css')}}" rel="stylesheet">
	<link href="{{asset('User/vendor/owl-carousel/owl.carousel.css')}}" rel="stylesheet">
    <link href="{{asset('User/css/style.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('/css/table.css')}}">
    <style>
        <?php 

 $notification =  auth()->user()->notification->take(8);

?>
 #containerz {
    width:580px; 
    font-family:verdana,arial,helvetica,sans-serif;
    font-size:11px;
    text-align:center;
    margin:auto;
 }  
#containerz a {
    display:block;
    color:#000;
    text-decoration:none;
    background-color:#f6f6ff;
 }
#containerz a:hover {
    color:#900;
    background-color:#f6f6ff;
 }
#no1 {
    width:190px;
    line-height:60px;
    border:1px solid #000;
    margin:auto;
 }
#no1 a {
    height:60px;
 }
#line1 {
    font-size:0;
    width:1px;
    height:20px;
    color:#fff;
    background-color:#000;
    margin:auto;
 } 
#line2 {
    font-size:0;
    width:424px;
    height:1px;
    color:#fff;
    background-color:#000;    
    margin:auto;
 } 
#line3 {
    font-size:0;
    display:inline;
    width:1px;
    height:20px;
    color:#fff;
    background-color:#000;
    margin-left:78px;
    float:left;
 }  
#line4,#line5,#line6 {
    font-size:0;
    display:inline;
    width:1px;
    height:20px;
    color:#fff;
    background-color:#000;
    margin-left:140px;
    float:left;
 }
#no2 {
    display:inline;
    border:1px solid #000;
    clear:both;
    margin-left:35px;
    float:left;
 }
#no2 a,#no4 a,#no8 a {
    width:84px; 
    height:50px;
    padding-top:8px; 
 }  
#no3 {
    display:inline;
    border:1px solid #000;
    margin-left:58px;
    float:left;
 }
#no3 a,#no5 a,#no6 a,#no7 a,#no9 a {
    width:84px; 
    height:42px;
    padding-top:16px;  
 } 
#no4 {
    display:inline;  
    border:1px solid #000;
    margin-left:53px;
    float:left;
 }  
#no5 {
    display:inline;   
    border:1px solid #000;
    margin-left:55px;
    float:left;
 }  
#line7,#line13 {
    font-size:0;
    display:inline;
    width:1px;
    height:38px;
    color:#fff;
    background-color:#000;
    margin-left:219px;
    float:left;
 } 
#line8,#line14 {
    font-size:0;
    display:inline;
    width:1px;
    height:38px;
    color:#fff;
    background-color:#000;
    margin-left:281px;
    float:left;
 }  
#no6,#no8 {
    display:inline;  
    border:1px solid #000;
    margin-left:107px;
    float:left;
 }
#line9,#line11,#line15,#line17 {
    font-size:0;
    display:inline;
    width:26px;
    height:1px;
    color:#fff;
    background-color:#000;    
    margin-top:29px;
    float:left;
 }  
#line10,#line12,#line16,#line18 {
    font-size:0;
    display:inline;
    width:1px;
    height:60px;
    color:#fff;
    background-color:#000;
    float:left;
 } 
#line16,#line18 {
    height:30px;
 }
#no7,#no9 {
    display:inline; 
    border:1px solid #000;
    margin-left:169px;
    float:left;
 } 
.clear {
    clear:both;
 }                                 
        </style>
</head>
<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
       

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
		
		<!--**********************************
            Chat box start
        ***********************************-->
	
		<!--**********************************
            Chat box End
        ***********************************-->
		
		<!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="dashboard_bar">
                                Dashboard
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                        <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link  ai-icon" href="#" role="button" data-toggle="dropdown">
                                    <i class="flaticon-381-ring"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div id="DZ_W_Notification1" class="widget-media dz-scroll p-3" style="height:380px;">
										<ul class="timeline">


                           @foreach(  $notification as $not)
											<li>
												<div class="timeline-panel">
												
													<div class="media-body">
													<a href ="{{route('readnot',$not->id)}}">	<h6 class="mb-1">{{$not->name}}</h6></a>
														<small class="d-block">{{$not->created_at}}</small>
													</div>
												</div>
											</li>

										@endforeach
										</ul>
									</div>
                                    <a class="all-notification" href="#">See all notifications <i class="ti-arrow-right"></i></a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                 
									<div class="header-info">
										<span>{{Auth::user()->name ?? ''}}</span>
								
									</div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    @if(!empty(Auth::user()) && Auth::user()->manager == 1)
                                <a href="{{ route('managers.index_purchase_order_request') }}" class="dropdown-item"><i class="icon-user-plus"></i>  management</a>
			@endif
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="deznav">
            <div class="deznav-scroll">
				<ul class="metismenu" id="menu">
                    <li><a class="has-arrow ai-icon"  href="{{route('user.purchase_tablez')}}" aria-expanded="false">
							<i class="flaticon-381-networking"></i>
							<span class="nav-text">purchase order</span>
						</a>
                    

                    </li>
                    <li><a class="has-arrow ai-icon" href="{{route('user.index_subcontractor_inv')}}" aria-expanded="false">
						<i class="flaticon-381-television"></i>
							<span class="nav-text">subcontractor invoice</span>
						</a>
                     
                    </li>
                    <li><a class="has-arrow ai-icon" href="{{route('user.index_frq_inv')}}" aria-expanded="false">
							<i class="flaticon-381-controls-3"></i>
							<span class="nav-text">RFQ</span>
						</a>
                
                    </li>
                    <li><a class="has-arrow ai-icon" href="{{route('user.index_employee_inv')}}" aria-expanded="false">
							<i class="flaticon-381-internet"></i>
							<span class="nav-text">employee Request</span>
						</a>
                     
                    </li>
                    <li><a class="has-arrow ai-icon" href="{{route('user.index_site_inv')}}" aria-expanded="false">
							<i class="flaticon-381-heart"></i>
							<span class="nav-text">site request</span>
						</a>
                     
                    </li>
                    <li><a href="{{route('user.index_petty_cash')}}" class="ai-icon" aria-expanded="false">
							<i class="flaticon-381-settings-2"></i>
							<span class="nav-text">petty_cash</span>
						</a>
					</li>
                    <li><a class="has-arrow ai-icon" href="{{route('user.index_matrial_request')}}" aria-expanded="false">
							<i class="flaticon-381-notepad"></i>
							<span class="nav-text">matrial request</span>
						</a>
                  
                    </li>

                </ul>
            
		
				<div class="copyright">
					<p><strong>Kripton Crypto Admin Dashboard</strong> © 2021 All Rights Reserved</p>
					<p class="fs-12">Made with <span class="heart"></span> by DexignZone</p>
				</div>
			</div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
		
		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" id="app">
            <!-- row -->
		
@yield('content')

        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://mostaql.com/u/hussein11225" target="_blank">hussein osama</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

	</div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="{{asset('/js/app.js')}}"></script>
    
    @yield('js')
    <script src="{{asset('User/vendor/global/global.min.js')}}"></script>
	<script src="{{asset('User/vendor/bootstrap-select/dist/js/bootstrap-select.min.js')}}"></script>
	<script src="{{asset('/vendor/chart.js/Chart.bundle.min.js')}}"></script>
	
	<!-- Chart piety plugin files -->
    <script src="{{asset('User/vendor/peity/jquery.peity.min.js')}}"></script>
	
	<!-- Apex Chart -->
	<script src="{{asset('User/vendor/apexchart/apexchart.js')}}"></script>
	
	<!-- Dashboard 1 -->
	<script src="{{asset('User/js/dashboard/dashboard-1.js')}}"></script>
	
	<script src="{{asset('User/vendor/owl-carousel/owl.carousel.js')}}"></script>
    <script src="{{asset('User/js/custom.min.js')}}"></script>
	<script src="{{asset('User/js/deznav-init.js')}}"></script>
	
    
	<script>
		function carouselReview(){
			jQuery('.testimonial-one').owlCarousel({
				loop:true,
				autoplay:true,
				margin:20,
				nav:false,
				rtl:true,
				dots: false,
				navText: ['', ''],
				responsive:{
					0:{
						items:3
					},
					450:{
						items:4
					},
					600:{
						items:5
					},	
					991:{
						items:5
					},			
					
					1200:{
						items:7
					},
					1601:{
						items:5
					}
				}
			})
		}
		jQuery(window).on('load',function(){
			setTimeout(function(){
				carouselReview();
			}, 1000); 
		});			
	</script>
</body>
</html>