<template>

        <div>
            	            <button   class="btn btn-light" v-print="'#printMe'">Print </button>


         <div class="container" id="printMe">

     
  
      
                <header >
        <img src="/img/275129174_711180993589195_571670907052531278_n.jpg"  style="height: 120px;" class="rounded d-block img-fluid" alt="Header">
    </header>
  <div class="details mt-2">
        <div class="mb-2 row align-items-center">
            <h1 class="title col-6 col-sm-1">Ref 
            </h1>
            
       
                  <span class="t-points">  :  </span>
           <div class="col-6 col-sm-4">
{{data.ref}}
        
                     </div>
         
          </div>
          <div class="mb-3 row align-items-center">
            <h1 class="title col-6 col-sm-1">Date</h1>
          <span class="t-points">  :  </span>
           <div class="col-6 col-sm-4">
         {{data.date}}
        
                     </div>
  
          </div>
          <div class="mb-3 row align-items-center">
            <h1 class="title col-4 col-sm-1">To</h1>
               <span class="t-points">  : </span>
            <div class="col-6 col-sm-4 fw-md">
                <span>{{data.to}}</span>
            </div>
          </div>
          <div class="mb-2 row align-items-center">
            <h1 class="title col-4 col-sm-1">Subject</h1>
                     <span class="t-points">  : </span>
         
            <div class="col-8">
               <span class="text-decoration-underline fw-md">{{data.subject}}</span>
            </div>
          </div>
          <div class="mb-2 row align-items-center">
            <h1 class="title col-4 col-sm-1">Project</h1>
       <span class="t-points">  : </span>
            <div class="col-8">
                <span class="text-decoration-underline fw-md" v-if="data.project">{{data.project.name }}</span>
            </div>
          </div>
    </div>
 
    <div class="subject mb-2 lh-base">
  {{data.content}}
    </div>
    <div class="matrials">
        <p class="ms-5 text-decoration-underline fw-md">MATERIALS : </p>
        <div class="table-responsive-sm">
        <table class="table table-bordered border-primary mb-2">
            <thead>
                <tr class="fw-md">
                
                    <th scope="col" class="fw-md fs-6">Description</th>
                    <th scope="col" class="fw-md fs-6">Qty</th>
                    <th scope="col" class="fw-md fs-6">Unit Price</th>
                    <th scope="col" class="fw-md fs-6">Amount (SAR)</th>
                  </tr>
              </thead>
              <tbody>
            
                <tr  v-for=" product in  data.attributes" :key="product.id">
               
                  <td class="text-center fs-6">{{product.name}}</td>
                  <td class="text-center fs-6">{{product.qty}}</td>
                  <td class="text-center fs-6">{{product.unit_price}}</td>
                  <td class="text-center fs-6">{{product.total }}</td>
                </tr>

                     <tr>
                    <td colspan="4" class="text-center fs-6"> VAT</td>
                    <td class="text-center fs-6">{{data.vat}}</td>
                </tr>
                
                <tr>
                    <td colspan="4" class="text-center fs-6">Total Cost</td>
                    <td class="text-center fs-6">{{data.total}}</td>
                </tr>
         
              </tbody>
        </table>
        </div>
    </div>
 
 <div class="qr row pt-4 pb-4">
        <div class="col-6">
          <qrcode-vue :value="this.route" size="90" level="L" />
        </div>
    <div class="col-6  row"
        >
              
        <div :key="data.id"  class="col-2"  v-for="data in data.subcontractor" >
                                            <template v-if="data.comment_subcontractor_cycle">
                                                            <div class="col-4">
                      <img :src="'/uploads/sign/'+data.comment_subcontractor_cycle.user.sign" alt="" width="80">
                                                            </div>
                                            </template>
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
data2:this.data,
payment:[{}],
date:'',
subject:'',
order_for:'',
cc:'',
ref:'',
userz:[],

choice:[],
to:'',
transportation:'',
delivery_date:'',
material_avalibility:'',
subject:'',
images:[],
}

        },

        methods:{

              print () {
     
      this.$htmlToPaper('printMe');
	  console.log( this.$htmlToPaper('printMe'))
    },

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
this.project_id = '',
this.products = [{}],
this.allerros = [],
this.payment = [{}],
this.date = '',
this.subject = '',
this.order_for = '',
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
if(this.payment.length > 0){
	 formData.append('payment', JSON.stringify(this.payment));
}
if(this.products.length > 0){
	 formData.append('attr', JSON.stringify(this.products));
}
if(this.date){
	 formData.append('date', this.date);
}
if(this.Vat){
	 formData.append('vat', this.Vat);
}
if(this.totalAmount){
	 formData.append('total', this.totalAmount);
}
if(this.subject){
	 formData.append('subject', this.subject);
}
if(this.order_for){
	 formData.append('order_for', this.order_for);
}

if(this.ref){
	 formData.append('ref', this.ref);
}

if(this.to){
	 formData.append('to', this.to);
}
if(this.transportation){
	 formData.append('transportation', this.transportation);
}
if(this.delivery_date){
	 formData.append('delivery_date', this.delivery_date);
}
if(this.material_avalibility){
	 formData.append('material_avalibility', this.material_avalibility);
}
if(this.userz.length > 0){
	 formData.append('users', JSON.stringify(this.userz));
}

if(this.images){
	 formData.append('count', this.images.length);
}


this.images.forEach((element, index, array) => {
	if(element !== undefined){
 formData.append('files-' + index, element);
	}
     
    });

    axios.post('/user/insarting_data',formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data' },
})
.then(res=>{
    
 
this.quotation = '',
this.project_id = 1,
this.products = [{}],
this.allerros = [],
this.payment = [{}],
this.date = '',
this.subject = '',
this.order_for = '',
this.cc = '',
this.ref = '',
this.userz = [],

this.choice = [],
this.to = '',
this.transportation= '',
this.delivery_date = '',
this.material_avalibility = '',
this.subject = ''
}).catch(error=>{
 if (error.response.status == 422){
     if(Array.isArray(error.response.data.errors)){
         this.allerros = error.response.data.errors;
     }else{
         try {
  this.allerros = JSON.parse(error.response.data.message);
         }
         catch{
                this.allerros = error.response.data.errors;
         }
     }

       
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
 
 addpayment(){
    this.payment.push({})
},
removepayment(index){
this.payment.splice(index,1)
}
 
 },
        mounted() {
                   if(Object(this.data2).length > 0){
                
 this.data2 = this.data

}
       else{
          this.data2 =  this.$cookies.get('subcontractor');


       }
        },
  
    }
</script>
