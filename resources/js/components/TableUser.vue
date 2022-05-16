<template>
     <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table datatable-button-print-basic">
                                        <thead>
                                            <tr>
                                             
                                                       <th><strong>CODE</strong></th>
                                                <th><strong>name</strong></th>
                                             
                                               <th><strong>role</strong></th>
                                             
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="data in datas.data " :key="data.id">
                                              
                                                <td data-table="role">{{data.id}}</td>
                                                <td data-table="name">{{data.name}}</td>
                                                <td data-table="role" v-if="data.role">{{data.role.name}}</td>
                                                                     <td  data-table="ACTION">

<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   ACTION
  </a>

  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

      <a class="dropdown-item" @click="admin(data)"  v-if="data.admin == 1" >make it user</a>
    
          <a class="dropdown-item" @click="admin(data)"  v-if="data.admin == 0" >make it admin</a>
    

  <a class="dropdown-item" :href="'/admin/user/edit/'+data.id"  >edit</a>
    
      <a class="dropdown-item" @click="manager(data)"  v-if="data.manager == 1" >make it user</a>
          <a class="dropdown-item" @click="manager(data)"  v-if="data.manager == 0" >make it manager</a>
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
                <button style="color:black" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span style="color:black" aria-hidden="true">&times;</span>
        </button>
     
      <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">تم العمليه بنجاح !</h4>
  <p> لقد نجحت في بمكانك اللقاء نظره</p>
  <hr>
<input type="button" class="btn btn-dark" data-dismiss="modal" value="الغاء">
</div>
      </div>
    </div>
  </div>


    <div id="deathEmployeeModal" class="modal fade" >
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

datas:{},
allerros:[],
}

        },

        methods:{


admin(data,index){

   

axios({
    url:'/admin/user/adminornot/'+data.id,
    method:'post',
}).then(res=>{

})

      
},


manager(data,index){

     

axios({
    url:'/admin/user/managerornot/'+data.id,
    method:'post',
}).then(res=>{

})

      
},

dele(data,index){

      if(confirm("Do you really want to delete?")){

axios({
    url:'/user/delete_matrial_request_data/'+data.id,
    method:'post',
}).then(res=>{
this.datas.data.splice(index,1)
 
})

      }
},
    getResults(page = 1) {
		axios({
  method: 'get',
  url: '/admin/user/jsonUser?page=' + page,

})		.then(response => {
                    
              this.datas =  response.data.data
            
                })
    },

    datajson() {
		axios({
  method: 'get',
  url: '/admin/user/jsonUser' ,

})		.then(response => {
                    
              this.datas =  response.data.data
            
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
