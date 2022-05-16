<template>
<div class="container">
<Editor />
</div>
</template>

<script>
import  Editor   from "./ExampleComponent.vue";

export default {
components:{
    Editor
},
  data() {
    return {
      editor: null,
    }
  },

  mounted() {
   
  },


}
</script>