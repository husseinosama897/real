<?php

use Illuminate\Database\Seeder;
use App\role;
use App\flowworkStep;
use App\workflow;
class roleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    $first =    role::create([
           'name'=>'Procurement Manger',
       ]);

       role::create([
        'name'=>'Mechanical Section Head Manger',
    ]);


    
    role::create([
        'name'=>'Electrical Section Head Manger',
    ]);

    role::create([
        'name'=>'MEP Manger',
    ]);

    role::create([
        'name'=>'HR Manger',
    ]);

 $General_Manager =    role::create([
        'name'=>'General Manager',
    ]);

    role::create([
        'name'=>'Executive Manger',
    ]);

  $second =   role::create([
        'name'=>'Projects Director',
    ]);


    $Projects_Manger =   role::create([
        'name'=>'Projects Manger',
    ]);

    

    role::create([
        'name'=>'Business Development Manger',
    ]);


    role::create([
        'name'=>'Technical Manger',
    ]);

    role::create([
        'name'=>'Document Controller',
    ]);
 $last =    role::create([
        'name'=>'Financial manager',
    ]);


    
    $workflow = workflow::create([
        'name'=>'matrial_request',
    ]);

  

    $flowworkStep = flowworkStep::create([
        'role_id'=>$first->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 1,
    ]);


    $flowworkStep = flowworkStep::create([
        'role_id'=>$second->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 2,
    ]);

    $flowworkStep = flowworkStep::create([
        'role_id'=>$last->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 3,
    ]);


    
    $workflow = workflow::create([
        'name'=>'subcontractor',
    ]);



    $flowworkStep = flowworkStep::create([
        'role_id'=>$second->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 1,
    ]);

    $flowworkStep = flowworkStep::create([
        'role_id'=>$General_Manager->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 2,
    ]);

    $flowworkStep = flowworkStep::create([
        'role_id'=>$last->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 3,
    ]);




    $workflow = workflow::create([
        'name'=>'site_request',
    ]);




    $flowworkStep = flowworkStep::create([
        'role_id'=>$second->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 1,
    ]);

    $flowworkStep = flowworkStep::create([
        'role_id'=>$General_Manager->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 2,
    ]);

    $flowworkStep = flowworkStep::create([
        'role_id'=>$last->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 3,
    ]);



    $workflow = workflow::create([
        'name'=>'letter_work',
    ]);




    $flowworkStep = flowworkStep::create([
        'role_id'=>$second->id,
        'work_flow_id'=>$workflow->id,
        'step'=> 1,
    ]);


////





$workflow = workflow::create([
    'name'=>'rfq',
]);




$flowworkStep = flowworkStep::create([
    'role_id'=>$Projects_Manger->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 1,
]);




/////


$workflow = workflow::create([
    'name'=>'petty_cash',
]);



$flowworkStep = flowworkStep::create([
    'role_id'=>$second->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 1,
]);


$flowworkStep = flowworkStep::create([
    'role_id'=>$General_Manager->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 2,
]);





/////


$workflow = workflow::create([
    'name'=>'purchase_order',
]);




$flowworkStep = flowworkStep::create([
    'role_id'=>$first->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 1,
]);

$flowworkStep = flowworkStep::create([
    'role_id'=> $second->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 2,
]);


$flowworkStep = flowworkStep::create([
    'role_id'=>$last->id,
    'work_flow_id'=>$workflow->id,
    'step'=> 3,
]);





    }
}
