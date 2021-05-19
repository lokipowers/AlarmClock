<template>
  <div class="home">
    <div class="next-alarm">
      <template v-if="nextAlarm !== null">
        <font-awesome-icon :icon="bell" />
        {{ nextAlarm }}
      </template>
      <div class="no-alarm-set">No alarm set</div>
    </div>
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
  },
  data(){
    return{
      nextAlarm: null
    }
  }
}
</script>

<style scoped lang="scss">

.next-alarm{
  margin-top:30px;
}

.time{
  margin-top:30px;
}

</style>
