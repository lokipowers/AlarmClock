<template>
  <div class="home">
    <nav-bar />
    <clock />
  </div>
</template>

<script>
// @ is an alias to /src
import Clock from '@/components/Clock.vue'
import NavBar from '../components/NavBar.vue'

export default {
  name: 'Home',
  components: {
    Clock,
    NavBar
  }
}
</script>

<style scoped lang="scss">

#nav{
  position:absolute;
  bottom:0;
  left:0;
  width:100%;

}

</style>
