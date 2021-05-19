<template>
  <div id="app">
    <router-view/>
    <nav-bar />
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue'

export default {
  name: 'App',
  components: {
    NavBar
  }
}
</script>

<style lang="scss">
*{
  cursor: none;
}
body{
  background:black;
  color:white;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}

.clock-wrap{
  position:absolute;
  top:0;
  left:0;
  border: 40px solid red;
  height: calc(100% - 80px);
  width: calc(100% - 80px);
}

/* Fonts */
@font-face {
  font-family: "Digital";
  src:url('./fonts/digital-7.mono.ttf') format('truetype');
}
@font-face {
  font-family: "Handwritingg";
  src:url('./fonts/Handwritingg_3.ttf') format('truetype');
}
@font-face {
  font-family: "Courier Prime";
  src:url('./fonts/Courier Prime.ttf') format('truetype');
}
@font-face {
  font-family: "Credit Card";
  src:url('./fonts/CreditCard.ttf') format('truetype');
}
@font-face {
  font-family: "Dotrice";
  src:url('./fonts/Dotrice-Regular.otf') format('opentype');
}
@font-face {
  font-family: "Gabriele";
  src:url('./fonts/gabriele-bad.ttf') format('truetype');
}
@font-face {
  font-family: "Minim";
  src:url('./fonts/minim.ttf') format('truetype');
}


</style> 


