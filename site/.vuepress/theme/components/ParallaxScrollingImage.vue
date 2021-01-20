<template>
  <div
    ref="parallaxScrollerScene"
    class="parallax-scroller"
  >
    <div
      class="parallax-scrolling-image-background"
      data-depth="0.1"
      :style="generateImageBackgroundStyle"
    />

    <img
      class="parallax-scrolling-image"
      data-depth="0.3"
      :src="foregroundImage"
      :class="foregroundImageClassObject"
      :style="generateImageStyle"
      alt="foreground-image"
    />
  </div>
</template>

<script>
import Parallax from 'parallax-js';

export default {
  name: 'ParallaxScrollingImage',
  props: {
    backgroundImage: {
      type: String,
      required: true,
    },
    foregroundImage: {
      type: String,
      required: true,
    },
    imageHeight: {
      type: String,
      required: true,
    },
    imagePosition: {
      type: String,
      required: false,
      default: 'left'
    }
  },

  computed: {
    generateImageBackgroundStyle() {
      return `background-image: url(${this.backgroundImage}); height: ${this.imageHeight}`;
    },

    generateImageStyle() {
      const imageHeight = parseInt(this.imageHeight);
      const imagePadding = imageHeight / 10;

      return `height: ${imageHeight + imagePadding}px;`;
    },

    foregroundImageClassObject() {
      return {
        'parallax-scrolling-image-center': this.imagePosition === 'center',
        'parallax-scrolling-image-right': this.imagePosition === 'right'
      }
    },
  },

  mounted() {
    this.initParallax();
  },

  methods: {
    initParallax() {
      const scene = this.$refs.parallaxScrollerScene;
      const parallaxInstance = new Parallax(scene, {
        relativeInput: true,
        hoverOnly: true,
      });

      parallaxInstance.friction(0.5, 0.1);
    }
  }
}
</script>

<style lang="scss">
.parallax-scroller {
  position: relative;
  overflow: hidden;

  .parallax-scrolling-image-background {
    width: 100%;
    height: 300px;
    background-size: 100% auto;
    background-repeat: no-repeat;
    opacity: 0.75;
  }

  .parallax-scrolling-image {
    bottom: 20px;
    width: auto;
    height: 320px;
  }

  .parallax-scrolling-image-center {
    margin: 0 auto;
    right: 0;
  }
}
</style>
