<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
  
    return view('welcome');
})->name('start');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/readnot/{notification}', 'NotificationController@readnot')->name('readnot');

Route::post('/addfile', 'processingController@addfile')->name('addfile');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/user/createpurchaseorder', 'purchaseController@createpurchaseorder')->name('user.purchase');
Route::post('/user/insarting_data', 'purchaseController@insarting_data')->name('user.insarting_data');

Route::post('/user/delete_data/{Purchase_order}', 'purchaseController@delete')->name('user.delete_data');

Route::get('/user/prepurchasereturn', 'purchaseController@prepurchasereturn')->name('user.prepurchasereturn');



Route::get('/user/purchase_table', 'purchaseController@index')->name('user.purchase_tablez');

Route::get('/user/returnasjson', 'purchaseController@returnasjson')->name('user.returnasjson');

Route::get('/user/purchasereturn/{Purchase_order}', 'purchaseController@purchasereturn')->name('user.purchasereturn');
//users
Route::post('/user/userautocomplete', 'userController@autocomplete')->name('user.userautocomplete');

Route::group(['prefix'=>'admin', 'middleware'=>['auth'=>'admin']],function(){
    //Admin
    
    Route::get('/project_index', 'projectController@index')->name('project.index');
    Route::get('/project_edit/{project}', 'projectController@edit')->name('project.edit');
    Route::get('/project_json', 'projectController@json')->name('project.json');
    Route::post('/update_project/{project}', 'projectController@update')->name('project.update');
    Route::post('/delete_project/{project}', 'projectController@delete')->name('project.delete');
    Route::post('/post_project', 'projectController@create')->name('project.create');

    
Route::get('/user/rig', 'userController@rig')->name('user.rig');

Route::get('/user/edit/{User}', 'userController@edit')->name('user.edit');

Route::post('/user/updateuser/{User}', 'userController@update')->name('user.update');

Route::post('/user/adminornot/{User}', 'userController@adminornot')->name('user.adminornot');

Route::post('/user/managerornot/{User}', 'userController@managerornot')->name('user.managerornot');


Route::get('/user/role', 'userController@role')->name('user.role');

Route::get('/user/jsonUser', 'userController@jsonUser')->name('user.jsonUser');

Route::get('/user/usertable', 'userController@usertable')->name('user.usertable');

Route::post('/user/add', 'userController@add')->name('user.add');

});

Route::get('/selectproject', 'projectController@selectproject')->name('project.selectproject');
//subcontractor
Route::post('/user/subcontractorinsrting', 'subcontractorController@subcontractorinsrting')->name('user.subcontractorinsrting');

Route::get('/user/createsubcontractorinv', 'subcontractorController@create')->name('user.createsubcontractorinv');

Route::get('/user/index_subcontractor_inv', 'subcontractorController@index')->name('user.index_subcontractor_inv');

Route::get('/user/subcontractorreturn/{subcontractor}', 'subcontractorController@subcontractorreturn')->name('user.subcontractorreturn');

Route::get('/user/returnsubcontractorasjson', 'subcontractorController@returnasjson')->name('user.returnasjson');



Route::get('/user/presubcontractorreturn', 'subcontractorController@presubcontractorreturn')->name('user.presubcontractorreturn');






Route::post('/user/delete_contractora_data/{subcontractor}', 'purchaseController@delete')->name('user.contractoradelete');




//frq

Route::post('/user/frqinsrting', 'rfqController@insrting')->name('user.frqinsrting');

Route::get('/user/createfrqinv', 'rfqController@create')->name('user.createfrqinv');

Route::get('/user/index_frq_inv', 'rfqController@index')->name('user.index_frq_inv');

Route::get('/user/frqreturn/{rfq}', 'rfqController@frqreturn')->name('user.frqreturn');

Route::get('/user/returnfrqasjson', 'rfqController@returnasjson')->name('user.returnasjson');

Route::get('/user/prefrqreturn', 'rfqController@prefrqreturn')->name('user.prefrqreturn');





Route::post('/user/delete_frq_data/{rfq}', 'rfqController@delete')->name('user.frqadelete');



//employee

Route::post('/user/employeeinsrting', 'employeeController@insrting')->name('user.employeeinsrting');

Route::get('/user/createemployeeinv', 'employeeController@create')->name('user.createemployeeinv');

Route::get('/user/index_employee_inv', 'employeeController@index')->name('user.index_employee_inv');

Route::get('/user/employeereturn/{employee}', 'employeeController@employeereturn')->name('user.employeereturn');


Route::get('/user/preemployeereturn' ,'employeeController@preemployeereturn')->name('user.preemployeereturn');





Route::get('/user/returnemployeeasjson', 'employeeController@returnasjson')->name('user.returnasjson');

Route::post('/user/delete_employee_data/{employee}', 'employeeController@delete')->name('user.employeeadelete');





//site

Route::post('/user/siteinsrting', 'siteController@insrting')->name('user.siteinsrting');

Route::get('/user/createsiteinv', 'siteController@create')->name('user.createsiteinv');

Route::get('/user/index_site_inv', 'siteController@index')->name('user.index_site_inv');

Route::get('/user/sitereturn/{site}', 'siteController@sitereturn')->name('user.sitereturn');

Route::get('/user/returnsiteasjson', 'siteController@returnasjson')->name('user.sitereturnasjson');

Route::get('/user/presitereturn', 'siteController@presitereturn')->name('user.presitereturn');





Route::post('/user/delete_site_data/{site}', 'siteController@delete')->name('user.siteadelete');



/// petty cash 


Route::post('/user/petty_cashinsrting', 'petty_cashController@insrting')->name('user.pettyinsrting');

Route::get('/user/create_petty_cash', 'petty_cashController@create')->name('user.create_petty_cash');

Route::get('/user/index_petty_cash', 'petty_cashController@index')->name('user.index_petty_cash');

Route::get('/user/petty_cashreturn/{petty_cash}', 'petty_cashController@petty_cashreturn')->name('user.petty_cashreturn');

Route::get('/user/returnpetty_cashasjson', 'petty_cashController@returnasjson')->name('user.returnpetty_cashasjson');


Route::get('/user/prepetty_cashreturn', 'petty_cashController@prepetty_cashreturn')->name('user.prepetty_cashreturn');





Route::post('/user/delete_petty_cash_data/{petty_cash}', 'petty_cashController@delete')->name('user.delete_petty_cash_data');


/// matrial_request

Route::post('/user/matrial_request_insrting', 'matrial_requestController@insarting')->name('user.matrialinsrting');

Route::get('/user/create_matrial_request', 'matrial_requestController@create')->name('user.create_matrial_requestController');

Route::get('/user/index_matrial_request', 'matrial_requestController@index')->name('user.index_matrial_request');

Route::get('/user/matrial_requestreturn/{matrial_request}', 'matrial_requestController@matrial_requestreturn')->name('user.matrial_requestreturn');

Route::get('/user/returnmatrial_requestasjson', 'matrial_requestController@returnasjson')->name('user.returnmatrial_requestasjson');

Route::get('/user/matrial_requestpreview', 'matrial_requestController@matrial_requestprereturn')->name('user.matrial_requestprereturn');








Route::post('/user/delete_matrial_request_data/{petty_cash}', 'matrial_requestController@delete')->name('user.matrial_request');



///managers_matrial_request
Route::group(['prefix'=>'managers', 'middleware'=>['auth'=>'manager']],function(){
    
Route::post('/action_matrial_request/{matrial_request}', 'managersMatrialrequestController@action')->name('managers.action_matrial_request');

Route::get('/update_matrial/{matrial_request}', 'managersMatrialrequestController@updatematrial_requestreturn')->name('managers.updatematrial_requestreturn');


Route::get('/index_matrial_request', 'managersMatrialrequestController@index')->name('managers.index_matrial_request');

Route::get('/returnjsonmatrial', 'managersMatrialrequestController@returnjsonmatrial')->name('managers.returnjsonmatrial');

Route::get('/matrial_requestreturn/{matrial_request}', 'managersMatrialrequestController@matrial_requestreturn')->name('managers.matrial_requestreturn');


// subcontractorManagerController

Route::post('/action_subcontractor_request/{subcontractor}', 'subcontractorManagerController@action')->name('managers.action_matrial_request');

Route::get('/update_subcontractor/{subcontractor}', 'subcontractorManagerController@update')->name('managers.updatematrial_requestreturn');


Route::get('/index_subcontractor_request', 'subcontractorManagerController@index')->name('managers.index_subcontractor_request');

Route::get('/returnjsonsubcontractor', 'subcontractorManagerController@returnasjson')->name('managers.returnjsonsubcontractor');

Route::get('/subcontractor_requestreturn/{subcontractor}', 'subcontractorManagerController@subcontractorreturn')->name('managers.subcontractorreturn');


// petty_cash_managers

Route::post('/action_petty_cash/{petty_cash}', 'managers_petty_cash_Controller@action')->name('managers.action_petty_cash_request');

Route::get('/update_petty_cash/{petty_cash}', 'managers_petty_cash_Controller@update')->name('managers.update_petty_cash_requestreturn');


Route::get('/index_petty_cash', 'managers_petty_cash_Controller@index')->name('managers.index_petty_cash_request');

Route::get('/returnjsonpetty_cash', 'managers_petty_cash_Controller@returnasjson')->name('managers.returnjsonpetty_cash');

Route::get('/petty_cashreturn/{petty_cash}', 'managers_petty_cash_Controller@petty_cashreturn')->name('managers.subcontractor_petty_cash');


// rfq_managers

Route::post('/action_rfq/{rfq}', 'managersrfqController@action')->name('managers.action_rfq_request');

Route::get('/update_rfq/{rfq}', 'managersrfqController@update')->name('managers.update_rfq_requestreturn');


Route::get('/index_rfq', 'managersrfqController@index')->name('managers.index_rfq_request');

Route::get('/returnjsonrfq', 'managersrfqController@returnasjson')->name('managers.returnjsonrfq');

Route::get('/rfqreturn/{rfq}', 'managersrfqController@rfqreturn')->name('managers.rfqii');




// managers site


Route::post('/action_site/{site}', 'sitemanagerController@action')->name('managers.action_site_request');

Route::get('/update_site/{site}', 'sitemanagerController@update')->name('managers.update_site_requestreturn');


Route::get('/index_site', 'sitemanagerController@index')->name('managers.index_site_request');

Route::get('/returnjsonsite', 'sitemanagerController@returnasjson')->name('managers.returnjsonrsite');

Route::get('/sitereturn/{site}', 'sitemanagerController@sitereturn')->name('managers.siteii');


// managers employee


Route::post('/action_employee/{employee}', 'employeemanagerController@action')->name('managers.action_employee_request');

Route::get('/update_employee/{employee}', 'employeemanagerController@update')->name('managers.update_employee_requestreturn');


Route::get('/index_employee', 'employeemanagerController@index')->name('managers.index_employee_request');

Route::get('/returnjsonemployee', 'employeemanagerController@returnasjson')->name('managers.returnjsonremployee');

Route::get('/employeereturn/{employee}', 'employeemanagerController@employeereturn')->name('managers.employeeii');





// purchase_managers

Route::post('/action_purchase_order/{purchase_order}', 'managerpurchaseController@action')->name('managers.action_purchase_order_request');

Route::get('/update_purchase_order/{purchase_order}', 'managerpurchaseController@update')->name('managers.update_purchase_order_requestreturn');


Route::get('/index_purchase_order', 'managerpurchaseController@index')->name('managers.index_purchase_order_request');

Route::get('/returnjsonpurchase', 'managerpurchaseController@returnjsonpurchase')->name('managers.returnjsonpurchase_order');

Route::get('/purchase_orderreturn/{purchase_order}', 'managerpurchaseController@purchasereturn')->name('managers.purchase_order');
});