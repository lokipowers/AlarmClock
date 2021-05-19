<template>
  <div :class="'time ' + clockFont">
    {{ currentHour }}<span class="sep"><span v-show="showSep">{{ sep }}</span></span>{{ currentMinute }}
  </div>
</template>

<script>
export default {
  name: "Clock",
  created() {},
  data() {
    return {
      hourFormat: 'H',
      flashSep: false,
      showSep: true,
      sep: ':',
      currentHour: this.$moment().format('H'),
      currentMinute: this.$moment().format('mm'),
      //currentSecond: this.$moment().format('ss'),
      clockFont: 'digital'
    };
  },
  props: {},
  methods: {
    setCurrentHour(){
      this.currentHour = this.$moment().format(this.hourFormat);
    },
    setCurrentMinute(){
      this.currentMinute = this.$moment().format('mm');
    },
    setCurrentTime(){

      this.showSep = !this.showSep;
      this.setCurrentHour();
      this.setCurrentMinute();

    }
    // setCurrentSecond(){
    //   this.currentSecond
    // }
  },
  mounted(){
    setInterval(this.setCurrentTime, 1000);
  }
};
</script>

<style lang="scss" scoped>

.time{
  font-size:300px;
}

.time.digital{
  font-family:"Digital";
  font-size:320px;
}
.time.handwritingg{
  font-family:'Handwritingg';
  font-size:380px;
}
.time.courier-prime{
  font-family: 'Courier Prime';
  font-size:270px;
}
.time.credit-card{
  font-family: 'Credit Card';
  font-size:200px;
}
.time.dotrice{
  font-family: 'Dotrice';
  font-size:220px;
}
.time.gabriele{
  font-family: 'Gabriele';
  font-size:250px;
}
.time.minim{
  font-family: 'Minim';
  font-size:230px;
}

.sep{
  width:0.5em;
  display:inline-block;
}

</style>