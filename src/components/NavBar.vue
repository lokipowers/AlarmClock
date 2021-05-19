<template>
  <div>
    <div id="nav">
      <template v-for="link in links">
        <router-link :to="link.route" :key="link.key">
          <font-awesome-icon :icon="['fas', link.icon]" />
        </router-link>
      </template>
      <a href="#" class="right" @click="toggleScreen">
        <font-awesome-icon :icon="['fas', 'power-off']" />
      </a>
    </div>
    <div v-show="isScreenOn === false" class="screen-on-overlay" @click="toggleScreen"></div>
  </div>
</template>

<script>

const axios = require('axios');
const apiPath = 'http://localhost:5000/';

export default {
  name: "NavBar",
  created() {},
  data() {
    return {

      links:[
        {
          key: 'Clock',
          route: '/',
          icon: 'clock'
        },
        {
          key: 'Alarms',
          route: '/alarms',
          icon: 'bell'
        },
        {
          key: 'Settings',
          route: '/settings',
          icon: 'cog'
        }
      ],

      isScreenOn: true

    };
  },
  props: {},
  methods: {

    async toggleScreen(e){
      e.preventDefault();
      this.isScreenOn = !this.isScreenOn;
      let path = apiPath + 'screen-power';
      axios.get(path, {params: {power: (this.isScreenOn === true ? 0 : 1)}});
    }

  },
};
</script>

<style lang="scss" scoped>

#nav{
  position:absolute;
  bottom:0;
  left:0;
  width:100%;
  background:rgba(255,255,255,0.1);
  a{
    display:inline-block;
    height:52px;
    width:52px;
    color:white;
    font-size:32px;
    opacity:0.7;
    line-height:52px;
    margin:0 30px;
    &.right{
      position: absolute;
      top:0;
      right:0;
      margin-right:10px;
    }
  }
}

.screen-on-overlay{
  position:fixed;
  top:0;
  left:0;
  width:100vw;
  height:100vh;
}

</style>