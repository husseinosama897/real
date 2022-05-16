<template>
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-md-8">
            <div class="card">
               <div class="card-header">Register</div>
               <div class="card-body">
                  <form method="POST"  v-on:submit.prevent="submit()" enctype="multipart/form-data">
                     <div class="form-group row mb-2">
                        <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                        <div class="col-md-6">
                           <input id="name" v-model="name" type="text" class="form-control @error('name') " name="name"  required autocomplete="name" autofocus>
                        </div>
                     </div>
                     <div class="form-group row mb-2">
                        <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                        <div class="col-md-6">
                           <input id="email" type="email" class="form-control @error('email') " name="email" v-model="email" required autocomplete="email">
                        </div>
                     </div>
                     <div class="form-group row mb-2">
                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                        <div class="col-md-6">
                           <input id="password" type="password" v-model="password" class="form-control @error('password') " name="password"  autocomplete="new-password">
                        </div>
                     </div>
                     <div class="form-group row mb-2">
                        <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                        <div class="col-md-6">
                           <input id="password-confirm"  v-model="password_confirmation" type="password" class="form-control" name="password_confirmation"  autocomplete="new-password">
                        </div>
                     </div>
                     <div class="form-group row mb-2">
                        <label for="password-confirm" class="col-md-4 col-form-label text-md-right">role </label>
                        <div class="col-md-6">
                           <select data-toggle="select2" class="form-control select2" v-model="role_id">
                              <option    v-for="role in roles"   :key="role.id" :value="role.id">{{role.name}}</option>
                           </select>
                        </div>
                     </div>
                     <div class="form-group mb-2">
                        <label class="col-sm" > sign  :</label>
                        <div class="col-sm">
                           <input type="file"   v-on:change="onImageChange($event)" >
                        </div>
                     </div>
                     <div class="form-group row mb-0">
                        <div class="col-md-6 offset-md-4">
                           <button type="submit" class="btn btn-primary">
                           update
                           </button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
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
        mounted() {
this.getrole()
this.name = this.data.name
this.role_id =  this.data.role_id
this.email =  this.data.email 

        },
       data(){
return{
   name:'',
            password_confirmation:'',
            password:'',
            sign:{},
            name:'',
            email:'',
            allerros:[],
            role_id:'',
            roles:[],
}
       },
  methods:{

           onImageChange(e) {     
this.sign = e.target.files[0]
            },

getrole(){

  axios({
        url:'/admin/user/role',
        method:'get',
        data:{
 
        }
    }).then(res=>{
         this.roles = res.data.data

    })
},
submit(){
   


         	const config = {

                    headers: { 'content-type': 'multipart/form-data' }

                }

                let formData = new FormData();

if(Object(this.sign).length > 0){
	 formData.append('sign', this.sign);
      
}
if(this.name){
	 formData.append('name', this.name);
}
if(this.password_confirmation){
	 formData.append('password_confirmation', this.password_confirmation);
}

if(this.password){
	 formData.append('password', this.password);
}

if(this.role_id){
	 formData.append('role_id', this.role_id);
}


if(this.email && this.email !== this.data.email){
	 formData.append('email', this.email);
}

  
    axios.post('/admin/user/updateuser/'+this.data.id ,formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
   .then(res=>{
          window.$("#editEmployeeModal").modal("show"); 

    })
},

  }
        
    }
</script>
