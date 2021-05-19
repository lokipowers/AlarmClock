<template>
  <div class="settings">
    <h1>Settings</h1>
    <div class="container">

      <div class="form-group">
        <label>Screen Brightness</label>
        <small>This will not override the alarm screen brightness</small>
        <input type="range" min="20" max="255" @input="changeScreenBrightness" :value="currentBrightness" />
      </div>
      <hr />


    </div>
  </div>
</template>

<script>

//const cmd = require('node-cmd'); 
const axios = require('axios');
const apiPath = 'http://localhost:5000/';

export default {
  name: 'Settings',
  data(){
    return{
      currentBrightness:0
    }
  },
  methods:{
    async getScreenBrightness(){
      let path = apiPath + 'get-screen-brightness';
      axios.get(path)
        .then((res) => {
          this.currentBrightness = res.data;
        });
    },
    async changeScreenBrightness(val){
      console.log(val.target.value);
      //cmd.run ('echo ' + val.target.value + ' > /sys/class/backlight/rpi_backlight/brightness');
      let path = apiPath + 'set-screen-brightness';
      axios.get(path, {params: {brightness: val.target.value}});
    }
  },
  mounted(){
    this.getScreenBrightness();
  }
}
</script>

<style lang="scss">

$track-w: 12.5em;
$track-h: .75em;
$thumb-d: 2.25em;

@mixin track() {
  border: none; /* because IE */
  width: $track-w; height: $track-h;
  box-shadow: 
    0 1px #fff, 
    inset 0 .125em .125em #7e7e7e, 
    inset 0 .125em .25em #7e7e7e, 
    inset 0 0 0 .25em #d6d6d6;
  background: #575757
}

@mixin thumb() {
  border: none;
  width: $thumb-d; height: $thumb-d;
  border-radius: .25em;
  box-shadow: 0 -1px #fefefe, 
    0 0 .125em #d0d0d0, 
    0 .875em .25em -.75em #4e4e4e, 
    0 1em .5em -.75em #4e4e4e, 
    0 .125em .25em #808080, 
    0 .25em .5em #808080, 
    inset 0 .25em .25em rgba(#ccc, .5), 
    inset 0 .5em .5em rgba(#ddd, .5);
  background: 
    linear-gradient(90deg, 
      rgba(#c9c9c9, 0) 15%, #c9c9c9 37.5%, #f4f4f4 0%,  
      #f4f4f4 62.5%, #c9c9c9 0%, rgba(#c9c9c9, 0) 85%)
    #fefefe
}

input[type='range'] {
  -webkit-appearance: none;
  border: solid 1em transparent;
  width: $track-w; height: $track-h;
  // background: 
  //   linear-gradient(90deg, #242424 2px, transparent 0), 
  //   linear-gradient(90deg, #242424 2px, transparent 0), 
  //   linear-gradient(90deg, rgb(65, 65, 65) 2px, transparent 0), 
  //   linear-gradient(90deg, rgb(65, 65, 65) 2px, transparent 0);
  // background-clip: padding-box;
  // background-position: 
  //   calc(.75em - 1px) 0, calc(.75em - 1px) calc(100% - 1px), 
  //   calc(.75em - 1px) 1px, calc(.75em - 1px) 100%;
  // background-repeat: repeat-x;
  // background-size: 1em 1em;
  background:none;
/* Firefox & Chrome/ Opera need this, 
     otherwise font-size is smaller */
  font-size: 1em;
  // cursor: pointer;

  &::-webkit-slider-runnable-track {
    -webkit-appearance: none;
    @include track()
  }

  &::-webkit-slider-thumb {
    -webkit-appearance: none;
		
		/* fix thumb position 
		 * starting from top of track */
    margin-top: .5*($track-h - $thumb-d);
    @include thumb()
  }

  &::-moz-range-track {
    z-index: -1; /* fix Firefox WTF */
    @include track()
  }

  &::-moz-range-thumb {
    @include thumb();
    
    /* Firefox-only, it won't work in IE 
       and it's messed up in Chrome */
    cursor: ew-resize
  }

  &::-ms-track {
    @include track();
    color: transparent
  }

  &::-ms-thumb {
    @include thumb()
  }

  &::-ms-fill-lower, &::-ms-fill-upper {
    background: transparent
  }
  
  /* wish I could style this asshole */
  &::-ms-tooltip { display: none }
  
  &:focus {
    outline: none;
    background-color: rgba(silver, .2);
    border-color: rgba(silver, .2)
  }
}


.container{
  max-width:80%;
  width:100%;
  margin:10px auto;
}
hr{
  background:none;
  border:none;
  border-top:1px solid white;
  margin:20px auto;
  width:80%;
  opacity:0.2;
}
.form-group{
  text-align:left;
  label{
    display:block;
    font-weight:bold;
  }
  input{
    width:100%;
    margin-top:15px;
  }
}

</style>
