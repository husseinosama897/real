/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

Vue.component('pru-component', require('./components/purchase/PruComponent.vue').default);

Vue.component('table-component', require('./components/purchase/TableComponent.vue').default);

Vue.component('print-purchase', require('./components/purchase/PrintPurchase.vue').default);





Vue.component('subcontractor-create-component', require('./components/subcontractor/CreateComponent.vue').default);

Vue.component('subcontractor-table-component', require('./components/subcontractor/TableComponent.vue').default);


Vue.component('print-sub', require('./components/subcontractor/PrintSub.vue').default);








Vue.component('frq-create-component', require('./components/frq/CreateComponent.vue').default);

Vue.component('frq-table-component', require('./components/frq/TableComponent.vue').default);

Vue.component('print-frq', require('./components/frq/Printfrq.vue').default);






Vue.component('employee-create-component', require('./components/employee/CreateComponent.vue').default);

Vue.component('employee-table-component', require('./components/employee/TableComponent.vue').default);


Vue.component('print-employee', require('./components/employee/PrintEmployee.vue').default);






Vue.component('site-create-component', require('./components/site/CreateComponent.vue').default);

Vue.component('site-table-component', require('./components/site/TableComponent.vue').default);

Vue.component('print-site', require('./components/site/PrintSite.vue').default);





Vue.component('petty-create-component', require('./components/petty/CreateComponent.vue').default);

Vue.component('petty-table-component', require('./components/petty/TableComponent.vue').default);


Vue.component('print-petty', require('./components/petty/PrintPetty.vue').default);




import VueCookies from 'vue-cookies'
Vue.use(VueCookies)
Vue.$cookies.config('1d')


Vue.component('matrial-table-component', require('./components/matrial_request/TableComponent.vue').default);

Vue.component('print-matrial', require('./components/matrial_request/PrintMatrial.vue').default);

Vue.component('create-matrial', require('./components/matrial_request/CreateComponent.vue').default);





//managers matrial 


Vue.component('matrial-update-manager', require('./components/managers/matrial_request/UpdateComponent.vue').default);

Vue.component('matrial-table-manager', require('./components/managers/matrial_request/TableComponent.vue').default);

Vue.component('print-matrial-manager', require('./components/managers/matrial_request/PrintMatrial.vue').default);



///

Vue.component('subcontractor-update-manager', require('./components/managers/subcontractor/UpdateComponent.vue').default);

Vue.component('subcontractor-table-manager', require('./components/managers/subcontractor/TableComponent.vue').default);

Vue.component('print-sub-manager', require('./components/managers/subcontractor/PrintSub.vue').default);

Vue.component('add-user', require('./components/AddUser.vue').default);

Vue.component('edit-user', require('./components/EditUser.vue').default);


Vue.component('table-user', require('./components/TableUser.vue').default);

Vue.component('project-component', require('./components/project/TableComponent.vue').default);





///

Vue.component('petty_cash-update-manager', require('./components/managers/petty_cash/UpdateComponent.vue').default);

Vue.component('petty_cash-table-manager', require('./components/managers/petty_cash/TableComponent.vue').default);

Vue.component('print-petty-manager', require('./components/managers/petty_cash/PrintPetty.vue').default);




///

Vue.component('rfq-update-manager', require('./components/managers/rfq/UpdateComponent.vue').default);

Vue.component('rfq-table-manager', require('./components/managers/rfq/TableComponent.vue').default);

Vue.component('print-frq-manager', require('./components/managers/rfq/Printfrq.vue').default);






Vue.component('add-user', require('./components/AddUser.vue').default);



Vue.component('edit-user', require('./components/EditUser.vue').default);


Vue.component('table-user', require('./components/TableUser.vue').default);



Vue.component('purchase-update-manager', require('./components/managers/purchase/UpdateComponent.vue').default);

Vue.component('purchase-table-manager', require('./components/managers/purchase/TableComponent.vue').default);

Vue.component('print-purchase-manager', require('./components/managers/purchase/PrintPurchase.vue').default);





Vue.component('site-update-manager', require('./components/managers/site/UpdateComponent.vue').default);

Vue.component('site-table-manager', require('./components/managers/site/TableComponent.vue').default);

Vue.component('print-site-manager', require('./components/managers/site/PrintSite.vue').default);




Vue.component('employee-update-manager', require('./components/managers/employee/UpdateComponent.vue').default);

Vue.component('employee-table-manager', require('./components/managers/employee/TableComponent.vue').default);

Vue.component('print-employee-manager', require('./components/managers/employee/PrintEmployee.vue').default);



import VueHtmlToPaper from 'vue-html-to-paper';

const options = {
    name: '_blank',
    specs: [
      'fullscreen=yes',
      'titlebar=yes',
  
      
      'scrollbars=yes'
    ],

    styles: [
    'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css'
,
'/preview/css/normalize.css',

'/preview/css/bootstrap.min.css',
'/preview/css/style.css',
'/preview/css/print2.css',
      'https://unpkg.com/kidlat-css/css/kidlat.css'
    ]
  }
Vue.use(VueHtmlToPaper, options);

import Print from 'vue-print-nb'
// Global instruction 
Vue.use(Print);




require('bootstrap/js/dist/modal');

Vue.component('pagination', require('laravel-vue-pagination'));


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',

});
