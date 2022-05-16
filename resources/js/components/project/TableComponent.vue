<template>
   <div class="row">
      <div class="col-lg-12">
         <div class="card">
            <div class="card-body">
               <div class="table-responsive">
                  <button type="button" @click="create()" class="btn btn-primary">
                  create
                  </button>
                  <table class="table datatable-button-print-basic">
                     <thead>
                        <tr>
                           <th><strong>CODE</strong></th>
                           <th><strong>name</strong></th>
                           <th></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr v-for="(data,index) in datas.data "  :key="data.id">
                           <td data-table="CODE">{{data.id}}</td>
                           <td data-table="name">{{data.name}}</td>
                           <td  data-table="ACTION">
                              <div class="dropdown">
                                 <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 ACTION
                                 </a>
                                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" @click="open(data)" >update</a>
                                    <a class="dropdown-item" @click="dele(data,index)"  href="#">delete</a>
                                 </div>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <pagination :data="datas" @pagination-change-page="getResults"></pagination>
               </div>
            </div>
         </div>
      </div>
      <div id="adz" class="modal fade " style="overflow:auto;">
         <div class="modal-dialog ">
            <div class="modal-content" style="overflow:auto;">
              <div class="modal-header justify-content-center">
                <button class="btn-close m-0" type="button" data-bs-dismiss="modal" aria-label="Close">
                </button>
              </div>
                <div class="modal-body">
                    <form method="POST"  v-on:submit.prevent="submit()" enctype="multipart/form-data">
                  <div class="mb-3">
                     <label for="exampleInputPassword1" class="form-label">name</label>
                     <input type="text" v-model="name" class="form-control" id="exampleInputPassword1">
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
               </form>
              </div>
            </div>
         </div>
      </div>
      <div id="deathEmployeeModal" class="modal fade" >
         <div class="modal-dialog ">
            <div class="modal-content" style="overflow:auto;">
                <div class="modal-body">
               <form method="POST"  v-on:submit.prevent="submit1()" enctype="multipart/form-data">
                  <div class="mb-3">
                     <label for="exampleInputPassword1" class="form-label">name</label>
                     <input type="text" v-model="updating.name" class="form-control" id="exampleInputPassword1">
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
               </form>
                </div>
            </div>
         </div>
      </div>
   </div>
</template>
<script>
    export default {
        props:['subcontractor'],
        data(){
return{

datas:{},
allerros:[],
name:'',
updating:{},
}

        },

        methods:{

create(){
  window.$("#adz").modal("show"); 
},

open(data){
this.updating = data

      window.$("#deathEmployeeModal").modal("show"); 

},
dele(data,index){

      if(confirm("Do you really want to delete?")){

axios({
    url:'/admin/delete_project/'+data.id,
    method:'post',
}).then(res=>{
this.datas.data.splice(index,1)
 
})

      }
},
    getResults(page = 1) {
		axios({
  method: 'get',
  url: '/admin/project_json/?page=' + page,

})		.then(response => {
                    
              this.datas =  response.data.data
            
                })
    },

    datajson(){
		axios({
  method: 'get',
  url: '/admin/project_json/' ,

})		.then(response => {
                    
              this.datas =  response.data.data
            
                })
    },


submit(){
   


         	const config = {

                    headers: { 'content-type': 'multipart/form-data' }

                }

                let formData = new FormData();


if(this.name){
	 formData.append('name', this.name);
}


  
    axios.post('/admin/post_project',formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
   .then(res=>{
      
       this.datas.data.push(res.data.data)
     
 window.$("#adz").modal("hide"); 
    })
},
submit1(){
   


         	const config = {

                    headers: { 'content-type': 'multipart/form-data' }

                }

                let formData = new FormData();


if(this.updating.name){
	 formData.append('name', this.updating.name);
}


  
    axios.post('/admin/update_project/'+this.updating.id,formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
   .then(res=>{
       this.name = ''
             window.$("#deathEmployeeModal").modal("hide"); 

    })
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
     this.datajson()
        },
      
    }
</script>
