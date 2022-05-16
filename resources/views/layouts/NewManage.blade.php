<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Limitless - Responsive Web Application Kit by Eugene Kopyov</title>

	<!-- Global stylesheets -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="{{asset('/global_assets/css/icons/icomoon/styles.min.css')}}" rel="stylesheet" type="text/css">
	<link href="{{asset('assets/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
	<link href="{{asset('assets/css/bootstrap_limitless.min.css')}}" rel="stylesheet" type="text/css">
	<link href="{{asset('assets/css/layout.min.css')}}" rel="stylesheet" type="text/css">
	<link href="{{asset('assets/css/components.min.css')}}" rel="stylesheet" type="text/css">
	<link href="{{asset('assets/css/colors.min.css')}}" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

    
	
  
	<!-- Core JS files -->
	<script src="{{asset('/global_assets/js/main/jquery.min.js')}}"></script>
	<script src="{{asset('/global_assets/js/main/bootstrap.bundle.min.js')}}"></script>
	<script src="{{asset('/global_assets/js/plugins/loaders/blockui.min.js')}}"></script>
	<!-- /core JS files -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

<?php 
            $employee = \App\workflow::where('name','employee')->first()->flowworkStep()
            ->get();
			$matrial_request = \App\workflow::where('name','matrial_request')->first()->flowworkStep()
			->get();

			$petty_cash =  \App\workflow::where('name','petty_cash')->first()->flowworkStep()
->get();

$site_request =  \App\workflow::where('name','site_request')->first()->flowworkStep()
->get();

$rfq =  \App\workflow::where('name','rfq')->first()->flowworkStep()
->get();


$subcontractor =\App\workflow::where('name','subcontractor')->first()->flowworkStep()
->get();


$purchase_order = \App\workflow::where('name','purchase_order')->first()->flowworkStep()
->get();


			?>
</head>

<body>

	<!-- Main navbar -->
	<div class="navbar navbar-expand-md navbar-light navbar-static">
		<div class="navbar-brand">
			<a href="index.html" class="d-inline-block">
				<img src="{{asset('/global_assets/images/logo_light.png')}}" alt="">
			</a>
		</div>

	

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="navbar-nav">
			
			
				<li class="nav-item dropdown">
				

				
				</li>
			</ul>

			<ul class="navbar-nav">
				<li class="nav-item dropdown show">
					<a href="#" class="navbar-nav-link" data-toggle="dropdown" aria-expanded="true">
						<i class="icon-git-compare"></i>

						<span class="badge badge-warning badge-pill ml-auto ml-lg-0"></span>
					</a>

					<div class="dropdown-menu dropdown-content wmin-lg-350 show">
						<div class="dropdown-content-header">
							<span class="font-weight-semibold">notification</span>
							<a href="#" class="text-body"><i class="icon-sync"></i></a>
						</div>

						<div class="dropdown-content-body dropdown-scrollable">
							<ul class="media-list">
								<li class="media">
									<div class="mr-3">
										<a href="#" class="btn bg-transparent border-primary text-primary rounded-pill border-2 btn-icon"></a>
									</div>
									@foreach( auth()->user()->notification->take(8) as $not)
											<li>
												<div class="timelphp artisan make:mailine-panel">
												
													<div class="media-body">
													<a href ="{{route('readnot',$not->id)}}">	<h6 class="mb-1">{{$not->name}}</h6></a>
														<small class="d-block">{{$not->created_at}}</small>
													</div>
												</div>
											</li>

										@endforeach

								</li>

						
									
								
						

						
									
							
								</li>

							
							</ul>
						</div>

				
					</div>
				</li>
			</ul>
			<span class="badge bg-success my-3 my-md-0 ml-md-3 mr-md-auto">Online</span>
		
	

			<ul class="navbar-nav">
			

				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
					
						<span>{{Auth::user()->name}}</span>
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a href="{{ route('home') }}" class="dropdown-item"><i class="icon-user-plus"></i> My home</a>
			
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
	</div>
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-light sidebar-main sidebar-expand-md">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				Navigation
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->


			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- User menu -->
				<div class="sidebar-user">
					<div class="card-body">
						<div class="media">
							<div class="mr-3">
								<a href="#"><img src="{{asset('/global_assets/images/placeholders/placeholder.jpg')}}" width="38" height="38" class="rounded-circle" alt=""></a>
							</div>

							<div class="media-body">
								<div class="media-title font-weight-semibold">{{Auth::user()->name}}</div>
						
							</div>

						
						</div>
					</div>
				</div>
				<!-- /user menu -->


				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

					
					@foreach($purchase_order as $purchase)
			
				@if(Auth::user()->role->name == $purchase->role->name)

						<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li>
				

                        <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_purchase_order_request') ? 'active' : '' }}"  href="{{route('managers.index_purchase_order_request')}}" aria-expanded="false">
							<i class="flaticon-381-networking"></i>
							<span class="nav-text">purchase order</span>
						</a>
                    

                    </li>
					@endif
					@endforeach
					
					@foreach($subcontractor as $sub)
				
				@if(Auth::user()->role->name == $sub->role->name)

                    <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_subcontractor_request') ? 'active' : '' }}" href="{{route('managers.index_subcontractor_request')}}" aria-expanded="false">
						<i class="flaticon-381-television"></i>
							<span class="nav-text">subcontractor  request</span>
						</a>
                     
                    </li>
					@endif
					@endforeach
					
					@foreach($rfq as $rf)
				
				@if(Auth::user()->role->name == $rf->role->name)

                    <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_rfq_request') ? 'active' : '' }}" href="{{route('managers.index_rfq_request')}}" aria-expanded="false">
							<i class="flaticon-381-controls-3"></i>
							<span class="nav-text">rfq </span>
						</a>
                
                    </li>
					@endif
					@endforeach
					@foreach($employee as $employes)
				
					@if(Auth::user()->role->name == $employes->role->name)
                    <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_employee_request') ? 'active' : '' }}" href="{{route('managers.index_employee_request')}}" aria-expanded="false">
							<i class="flaticon-381-internet"></i>
							<span class="nav-text">employee request</span>
						</a>
						@endif
				
						@endforeach
                     
                    </li>
					
					@foreach($site_request as $site)
				
				@if(Auth::user()->role->name == $site->role->name)

				
                    <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_site_request') ? 'active' : '' }}" href="{{route('managers.index_site_request')}}" aria-expanded="false">
							<i class="flaticon-381-heart"></i>
							<span class="nav-text">site request</span>
						</a>
                     
                    </li>
@endif
					@endforeach
					
					@foreach($petty_cash as $petty)
				
				@if(Auth::user()->role->name == $petty->role->name)

                    <li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('managers.index_petty_cash_request') ? 'active' : '' }}" href="{{route('managers.index_petty_cash_request')}}" class="ai-icon" aria-expanded="false">
							<i class="flaticon-381-settings-2"></i>
							<span class="nav-text">petty_cash</span>
						</a>
					</li>
					@endif
					@endforeach
					
					@foreach($matrial_request as $matrial)
				
				@if(Auth::user()->role->name == $matrial->role->name)

                    <li class="nav-item"><a  class="nav-link {{ Route::currentRouteNamed('managers.index_matrial_request') ? 'active' : '' }}"   href="{{route('managers.index_matrial_request')}}" aria-expanded="false">
							<i class="flaticon-381-notepad"></i>
							<span class="nav-text"> matrial request</span>
						</a>
                  
                    </li>
					@endif
					@endforeach

					<li class="nav-item"><a  class="nav-link {{ Route::currentRouteNamed('managers.usertable') ? 'active' : '' }}"  href="{{route('user.usertable')}}" aria-expanded="false">
							<i class="flaticon-381-notepad"></i>
							<span class="nav-text">users</span>
						</a>
                  
                    </li>
           
					<li class="nav-item"><a class="nav-link {{ Route::currentRouteNamed('project.index') ? 'active' : '' }}" href="{{route('project.index')}}" aria-expanded="false">
							<i class="flaticon-381-notepad"></i>
							<span class="nav-text">projects</span>
						</a>
                  
                    </li>
           

					
				
				
						<!-- /forms -->

						<!-- Components -->
			
						<!-- /components -->

			
						<!-- /layout -->

		
						<!-- /page kits -->

					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->


		<!-- Main content -->
		<div class="content-wrapper" id="app">

@yield('content')

	</div>
	<!-- /page content -->
    <script src="{{asset('/js/app.js')}}"></script>
    	<!-- Theme JS files -->
	<script src="{{asset('/global_assets/js/plugins/visualization/d3/d3.min.js')}}"></script>
	<script src="{{asset('/global_assets/js/plugins/visualization/d3/d3_tooltip.js')}}"></script>
	<script src="{{asset('/global_assets/js/plugins/forms/styling/switchery.min.js')}}"></script>
	<script src="{{asset('/global_assets/js/plugins/ui/moment/moment.min.js')}}"></script>
	<script src="{{asset('/global_assets/js/plugins/pickers/daterangepicker.js')}}"></script>


	<script src="{{asset('/global_assets/js/demo_pages/dashboard.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/streamgraph.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/sparklines.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/lines.js')}}"></script>	
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/areas.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/donuts.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/bars.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/progress.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/heatmaps.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/pies.js')}}"></script>
	<script src="{{asset('/global_assets/js/demo_charts/pages/dashboard/dark/bullets.js')}}"></script>
	<!-- /theme JS files -->

</body>
</html>
