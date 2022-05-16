/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import VueRouter from 'vue-router'

Vue.use(VueRouter)
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


import matrial_requestCreate from './components/matrial_request/CreateComponent.vue'



const routes = [
  { path: '/', component: matrial_requestCreate, name:'create'  },

]
const router = new VueRouter({
  routes 
})
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
    router
});
