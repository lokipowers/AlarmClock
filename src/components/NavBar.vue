<template>
  <div>
    <div id="nav">
      <a href="#" class="left" @click="startAlarm">
        <font-awesome-icon :icon="['fas', 'exclamation-triangle']" />
      </a>
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
    <div v-show="isAlarming === true" class="alarm-modal">
      <button class="btn large snooze" @click="snoozeAlarm">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="snooze" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-snooze fa-w-14 fa-5x"><path fill="currentColor" d="M192 224H40a24 24 0 0 0-24 24v48a24 24 0 0 0 24 24h50.44L8.08 412.66A32 32 0 0 0 0 433.92V480a32 32 0 0 0 32 32h152a24 24 0 0 0 24-24v-48a24 24 0 0 0-24-24h-50.44l82.36-92.66a32 32 0 0 0 8.08-21.26V256a32 32 0 0 0-32-32zm0-32h96a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16h-34.75l57.38-57.38A32 32 0 0 0 320 48V32a32 32 0 0 0-32-32H184a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h42.75l-57.38 57.38A32 32 0 0 0 160 144v16a32 32 0 0 0 32 32zm256 80v-16a32 32 0 0 0-32-32h-96a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h34.75l-57.38 57.38A32 32 0 0 0 288 368v16a32 32 0 0 0 32 32h104a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16h-42.75l57.38-57.38A32 32 0 0 0 448 272z" class=""></path></svg>
      </button>
      <button class="btn large stop" @click="stopAlarm">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-inline--fa fa-ban fa-w-16 fa-7x"><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z" class=""></path></svg>
      </button>
    </div>
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

      isScreenOn: true,
      isAlarming: false

    };
  },
  props: {},
  methods: {

    async toggleScreen(e){
      e.preventDefault();
      this.isScreenOn = !this.isScreenOn;
      let path = apiPath + 'screen-power';
      axios.get(path, {params: {power: (this.isScreenOn === true ? 0 : 1)}});
    },

    async startAlarm(){
      //alert("WAKE UP!");
      this.isAlarming = true;
      document.getElementById('app').classList.add('alarm-running');
      let path = apiPath + 'start-alarm';
      axios.get(path);
    },

    async snoozeAlarm(){
      //alert('Alarm Snoozed');
      this.isAlarming = false;
      document.getElementById('app').classList.remove('alarm-running');
      let path = apiPath + 'stop-alarm';
      axios.get(path);
      setTimeout(this.startAlarm, 5000);
    },

    async stopAlarm(e){
      e.preventDefault();
      this.isAlarming = false;
      document.getElementById('app').classList.remove('alarm-running');
      let path = apiPath + 'stop-alarm';
      axios.get(path);
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
    &.left{
      position: absolute;
      top:0;
      left:0;
      margin-left:10px;
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


.alarm-modal{
  position:fixed;
  top:0;
  left:0;
  width:100vw;

  .btn{
    width:200px;
    border:none;
    vertical-align: top;
    position: absolute;
    top:0;
    padding:10px;
    &.snooze{
      left:0;
    }
    &.stop{
      right:0;
    }
    
    svg{
      height:90px;
    }
  }
}

</style>