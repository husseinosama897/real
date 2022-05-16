<template>
   <div class="container">
      <form method="POST"  v-on:submit.prevent="submit()" enctype="multipart/form-data">
         <div class="row justify-content-center">
            <div class="col">
               <div class="card">
                  <div class="card-body">
                     <div class="row">
                        <div class="col-xl-2 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default " v-model="ref" placeholder="Ref">
                           </div>
                        </div>
                        <div class="col-xl-2 mb-2">
                           <div class="form-group">
                              <input type="date" class="form-control input-rounded" v-model="date" placeholder="input-rounded">
                           </div>
                        </div>
                         <div class="col-xl-3 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default " v-model="subject" placeholder="subject">
                           </div>
                        </div>
                        <div class="col-xl-3 mb-2">
                           <div class="form-group">
                              <select class="form-select select2" v-model="project_id">
                                 <option>Select</option>
                                 <option v-for="project in projects" :key="project.id" :value="project.id" style="line-height: normal;
    color: #000;">{{project.name}}</option>
                              </select>
                           </div>
                        </div>
                        <div class="col-xl-2 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default " v-model="to" placeholder="to">
                           </div>
                        </div>
                     </div>
                    <div class="form-group">
                     <label for="password" class="form-label">content</label>
                     <textarea class="form-control" v-model="content" rows="4">
                     </textarea>
                  </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="card">
               <div class="table-responsive">
                  <table class="table table-responsive-md">
                     <thead>
                        <tr>
                           <th ><strong>No.</strong></th>
                           <th style="width: 30%"><strong>Item description</strong></th>
                           <th><strong>unit</strong></th>
                           <th><strong>qty</strong></th>
                           <th><strong>unit price</strong></th>
                           <th><strong>total</strong></th>
                           <th></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr v-for="(product,index) in products" :key="index">
                           <td><strong>{{index}}</strong></td>
                           <td style="width: 30%">
                              <textarea v-model="product.name" class="form-control" style="max-height: 2.3rem;">
                              </textarea>
                           </td>
                           <td>     <input v-model="product.unit" class="form-control"></td>
                           <td>     <input v-model="product.qty" class="form-control"></td>
                           <td>     <input v-model="product.unit_price" class="form-control"></td>
                           <td>{{ product.unit_price * product.qty  }}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row justify-content-center">
               <div class="col">
                  <div class="card">
                     <div class="card-header">
                        <h4 class="card-title">total_amount : {{data.total - data.vat}}</h4>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row justify-content-center">
               <div class="col">
                  <div class="card">
                     <div class="card-header">
                        <h4 class="card-title">VAT : {{data.vat}}</h4>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="card col row">
               <div class="card-header page-title-box">
                    <div class="page-title-left d-flex align-items-center">
                        <!-- <a @click="addpayment()" class="btn btn-success">
                        <strong style="color:white;">ADD+</strong>
                        </a> -->
                    </div>
               </div>
               <div class="table-responsive col-md-6 col">
                  <table class="table table-responsive-md">
                     <thead>
                        <tr>
                           <th ><strong>No.</strong></th>
                           <th ><strong> description</strong></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr v-for="(pay, index) in data.note" :key="index">
                           <td><strong>{{ index }}</strong></td>
                           <td >
                              <textarea v-model="pay.dis" class="form-control" rows="1">
                               
                              </textarea>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
               <div class="col-xl-4">
               <div class="card">
                     <div class="card-header d-block">
                        <h4 class="card-title"> managers Comments</h4>
                  
                     </div>
                     <div class="card-body">
                        <div id="accordion-twelve" class="accordion accordion-rounded-stylish accordion-gradient">
                           <div class="accordion__item" :key="data.id"  v-for="data in matrial_request_cycle">
                                 <template v-if="data.comment_matrial_cycle">
                                 <div class="accordion__header accordion__header--primary" data-toggle="collapse" data-target="#gradient_collapseOne"> <span class="accordion__header--icon"></span>
                                    <span class="accordion__header--text">{{data.role.name}}</span>
                                    <span class="accordion__header--indicator"></span>
                                 </div>
                                 <div id="gradient_collapseOne" class="collapse accordion__body show" data-parent="#accordion-twelve">
                                    <div class="accordion__body--text" >
                                       {{data.comment_matrial_cycle.content}}
                                    </div>
                                    
                                    <a  :href="'/uploads/matrial_request/'+cycle.path" v-for="cycle in data.comment_matrial_cycle.attachment_matrial_cycle" :key="cycle.id" download >  <span class="badge badge-pill badge-danger">
                                       file
                                       </span></a>
                                 </div>
                                 </template>
                           </div>
                     
                        </div>
                     </div>
               </div>
            </div>
            <div class="col">
               <div class="card">
                  <div class="card-header d-block">
                     <h4 class="card-title"> add your comment</h4>
                     <p class="m-0 subtitle">Add <code>comments</code> and <code>attachments</code></p>
                  </div>
                  <div class="card-body">
                    <div class="form-group">
                        <textarea v-model="contentmanager" placeholder="content" class="form-control mb-2"> 
                                    </textarea>
                        <label class="col-sm" > files  :</label>
                        <div class="col-sm">
                            <input type="file"   v-on:change="onImageChange($event)" >
                        </div>
                        <div class="col-xl-4 mb-2 mt-2">
                        <label for="password" class="col-sm">status</label>
                        <div class="form-group">
                           <select class="form-select select2" aria-label=".form-select-sm example" v-model="status">
                              <option value="1">Accept</option>
                              <option value="2">Reject</option>
                           </select>
                        </div>
                     </div>
                    </div>
                  </div>

               </div>
            </div>
            <div class="container">
               <div class="row justify-content-center">
                  <div class="col">
                     <div class="card">
                        <div class="card-header">
                           <button class="btn btn-primary"  type="submit">
                           submit
                           </button>
                           <button   @click="reset()" class="btn btn-danger"  type="button">
                           reset
                           </button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </form>
      <div id="editEmployeeModal" class="modal fade bd-example-modal-sm" style="overflow:auto;">
         <div class="modal-dialog ">
            <div class="modal-content" style="overflow:auto;">
               <button style="color:black" type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span style="color:black" aria-hidden="true">&times;</span>
               </button>
               <div class="alert alert-success" role="alert">
                  <h4 class="alert-heading">Done !</h4>
                  <p>Process has been submitted successfully</p>
                  <hr>
                  <input type="button" class="btn btn-dark" data-dismiss="modal" value="close">
               </div>
            </div>
         </div>
      </div>
      <div id="deathEmployeeModal" class="modal fade bd-example" style="overflow:auto;">
         <div class="modal-dialog ">
            <div class="modal-content" style="overflow:auto;">
               <div class="alert alert-danger" role="alert">
                  <h4 class="alert-heading"> فشلت العمليه  !</h4>
                  <p>    :  لقد فشلت العمليه للاسباب التاليه </p>
                  <p v-for="(err,index)  in allerros" :key="index"> {{err}}</p>
                  <hr>
                  <input type="button" class="btn btn-dark" data-dismiss="modal" value="الغاء">
               </div>
            </div>
         </div>
      </div>
   </div>
</template>
<script>

    export default {
props:['data'],
        data(){
return{

quotation:'',
project_id:1,
products:[{}],
allerros:[],
status:'',
condition:[{}],
date:'',
subject:'',
content:'',
images:[],
cc:'',
ref:'',
userz:[],

choice:[],
to:'',
contentmanager:'',
matrial_request_cycle:[],
transportation:'',
delivery_date:'',
material_avalibility:'',
subject:'',
projects: [],
note: [],
}

        },

        methods:{
              onImageChange(e) {     
this.images.push(e.target.files[0])
            },

         deleteuser(index){
                this.userz.splice(index,1)
            }
,
takethischoice(user){
this.userz.push(user)
   this.choice.splice(0)
},

users(){
    this.choice.splice(0)
    axios({
        url:'/user/userautocomplete',
        method:'post',
        data:{
            name:this.cc
        }
    }).then(res=>{
        this.choice = res.data.data
    })
},
reset(){
    
this.quotation = '',
this.project_id = 1,
this.products = [{}],
this.allerros = [],
this.condition = [{}],
this.date = '',
this.subject = '',

this.content = '',
this.cc = '',
this.ref = '',
this.userz = [],

this.choice = [],
this.to = '',
this.transportation= '',
this.delivery_date = '',
this.material_avalibility = '',
this.subject = ''
},

submit(){

      	const config = {

                    headers: { 'content-type': 'multipart/form-data' }

                }

                let formData = new FormData();

if(this.project_id){
	 formData.append('project_id', this.project_id);
}
if(this.quotation){
	 formData.append('quotation', this.quotation);
}
if(this.images){
	 formData.append('count', this.images.length);
}


this.images.forEach((element, index, array) => {
	if(element !== undefined){
 formData.append('files-' + index, element);
	}
     
    });

if(this.contentmanager ){
	 formData.append('contentmanager', this.contentmanager);
}



if(this.date){
	 formData.append('date', this.date);
}

if(this.subject){
	 formData.append('subject', this.subject);
}
if(this.content){
	 formData.append('content', this.content);
}

if(this.ref){
	 formData.append('ref', this.ref);
}

if(this.status){
	 formData.append('status', this.status);
}

if(this.to){
	 formData.append('to', this.to);
}


if(this.userz.length > 0){
	 formData.append('users', JSON.stringify(this.userz));
}
    axios.post('/managers/action_matrial_request/'+this.data.id,formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
.then(res=>{
    window.$("#editEmployeeModal").modal("show");
this.quotation = '',
this.project_id = '',
this.products = [{}],
this.allerros = [],
this.condition = [{}],
this.date = '',
this.contentmanager='',
this.subject = '',
this.content = '',
this.cc = '',
this.ref = '',
this.userz = [],

this.choice = [],
this.to = '',
this.transportation= '',
this.delivery_date = '',
this.material_avalibility = '',
this.subject = ''

 window.location.href = ('https://www.portal-cp.com/managers/index_matrial_request')



}).catch(error=>{
 if (error.response.status == 422){
     if(Array.isArray(error.response.data.errors)){
         this.allerros = error.response.data.errors;
     }else{
  this.allerros = JSON.parse(error.response.data.message);
     }
window.$("#deathEmployeeModal").modal("show"); 
       
      }
    })
},

addproduct(){
    this.products.push({})
},
removeproduct(index){
this.products.splice(index,1)
}
 ,
 
 addcondition(){
    this.condition.push({})
},
removecondition(index){
this.condition.splice(index,1)
},
                        project(){
    
axios({
    url:'/selectproject',
    method:'get',
}).then(res=>{
    
    	 if(Array.isArray(res.data.data)){
     

                    res.data.data.forEach(n=>{
                         n.forEach(z=>{
this.projects.push(z)
                    })
                        })
                 }else{

let vm = []

                   Object.keys(res.data.data).map((n)=>{

                this.projects.push(res.data.data[n])
                     })

                 }

})
}
 },
        mounted() {
       
this.project_id = this.data.project_id,
this.products = this.data.attributes,
this.condition = this.data.note,
this.date =this.data.date,
this.subject = this.data.subject,
this.content = this.data.content,
this.ref = this.data.ref,
this.matrial_request_cycle = this.data.matrial_request_cycle ?? [],
this.to = this.data.to,
this.note = this.data.note,
this.material_avalibility = this.data.material_avalibility,
this.transportation = this.data.transportation,
this.delivery_date = this.data.delivery_date,
this.products = this.data.attributes,
this.project()

        },
     
    }
</script>
