<template>
  <div id="nav">
      <template v-for="link in links">
        <router-link :to="link.route" :key="link.key">
          <font-awesome-icon :icon="['fas', link.icon]" />
        </router-link>
      </template>
    </div>
</template>

<script>

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
      ]

    };
  },
  props: {},
  methods: {},
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
  }
}

</style>