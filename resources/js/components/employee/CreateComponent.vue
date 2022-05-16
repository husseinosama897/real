<template>
   <div class="container">
      <form method="get" action="/user/preemployeereturn" >
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
                              <input type="date" lang="en-US" class="form-control input-rounded" v-model="date" placeholder="input-rounded">
                           </div>
                        </div>
                        <div class="col-xl-4 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default " v-model="subject" placeholder="subject">
                           </div>
                        </div>
                        <div class="col-xl-4 mb-2">
                           <div class="form-group">
                              <select class="form-select select2">
                                 <option  v-for="project in projects" :key="project.id" :value="project.id">{{project.name}}</option>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-xl-4 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default " v-model="to" placeholder="to">
                           </div>
                        </div>
                         <div class="col-xl-4 mb-2">
                           <div class="form-group">
                              <input type="text" class="form-control input-default "
                                 @input="users()"
                                 v-model="cc" placeholder="cc">
                              <ul  v-if="choice.length > 0" class="list-group">
                                 <li class="list-group-item" @click="takethischoice(cho)" v-for="cho in choice"  :key="cho.id" >{{cho.name}}</li>
                              </ul>
                           </div>
                        </div>
                        <div class="col-xl-4">
                           <button class="btn btn-primary"   type="button" @click="addcc()">
                           add
                           </button>
                        </div>
                     </div>
                     <div class="row justify-content-center">
                        <div class="card" v-if="userz.length > 0">
                           <div class="table-responsive">
                              <table    class="table table-responsive-md">
                                 <thead >
                                    <tr>
                                       <th ><strong>No.</strong></th>
                                       <th style="width:30%;"><strong>name</strong></th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr v-for="(user,index) in userz" :key="index">
                                       <td><strong>{{index}}</strong></td>
                                       <td style="width:30%;">
                                          {{user.name}}
                                       </td>
                                       <td>
                                          <a class="btn btn-danger" @click="deleteuser(index)" >
                                          <strong style="color:white;">  Delete</strong>
                                          </a>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="password" class="form-label">conent</label>
                        <textarea class="form-control" v-model="order_for" rows="6">
                        </textarea>
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
                        <button class="btn btn-primary"  type="button" @click="submit()">
                        submit
                        </button>
                        <button class="btn btn-primary"   @click="submit2()" type="button" >
                        perview
                        </button>
                        <button   @click="reset()" class="btn btn-danger"  type="button">             
                        reset
                        </button>
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
        data(){
return{

quotation:'',
project_id:1,
products:[{}],
allerros:[],
payment:[{}],
date:'',
projects:[],
subject:'',
userz:[],
content:'With reference to the above subject, ',
choice:[],
cc:'',
ref:'',
to:'',
transportation:'',
delivery_date:'',
material_avalibility:'',
subject:'',
}

        },

        methods:{
                          addcc(){


this.userz.push({name:this.cc, email:this.cc})
this.cc = ''
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
  this.project_id = '',
  this.products = [{}],
  this.allerros = [],
  this.date= '',
  this.subject= '',
  this.content = '',
  this.to = ''
},
submit(){


    

    const  data = {ref:this.ref,

 to:this.to,

total:this.totalAmount,

content: this.content,


subject: this.subject
      }

this.$cookies.set('employee',data);


          	const config = {

                    headers: { 'content-type': 'multipart/form-data' }

                }

                let formData = new FormData();

if(this.ref){
	 formData.append('ref', this.ref);
}


if(this.project_id){
	 formData.append('project_id', this.project_id);
}
if(this.date){
	 formData.append('date', this.date);
}
if(this.totalAmount){
	 formData.append('total', this.totalAmount);
}
if(this.Vat){
	 formData.append('Vat', this.Vat);
}
if(this.subject){
	 formData.append('subject', this.subject);
}
if(this.content){
	 formData.append('content', this.content);
}
if(this.to){
	 formData.append('to', this.to);
}

if(this.userz.length > 0){
	 formData.append('users', JSON.stringify(this.userz));
}
     axios.post('/user/employeeinsrting',formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
.then(res=>{
    this.quotation = '',
    this.userz = [],
  this.project_id = 1,
 
  this.allerros = [],
  this.date= '',
  this.subject= '',
  this.content = '',
  this.to = '',
  this.subject = '',
this.$cookies.remove("employee");
      window.$("#editEmployeeModal").modal("show"); 
})
.catch(error=>{
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
     goto(){
      window.location.href = ('/user/preemployeereturn')

     },

submit2(){
var projectname = {}

this.projects.forEach(e=>{
    if(e.id == this.project_id){
        projectname.name = e.name
    }
})

    const  data = {ref:this.ref,
 
 to:this.to,
project:projectname,
total:this.totalAmount,

content:this.content,

subject: this.subject
      }

this.$cookies.set('employee',data);


 window.location.href = ('/user/preemployeereturn')

},


addproduct(){
    this.products.push({})
},
removeproduct(index){
this.products.splice(index,1)
}
 ,
 
 addpayment(){
    this.payment.push({})
},
removepayment(index){
this.payment.splice(index,1)
}
 
 },
        mounted() {
           this.project()

                 var dataa =  this.$cookies.get('employee');

this.ref = dataa.ref,
 this.payment = dataa.note,
this.to = dataa.to
 this.content =dataa.content
 this.subject = dataa.subject


        },
      
    }
</script>
