<template>
  <div class="image-component">
    <template
      v-if="backgroundImageUrl.length > 0"
    >
      <parallax-scrolling-image
        :backgroundImage="backgroundImageUrl"
        :foregroundImage="imageUrl"
        :imageHeight="imageHeight"
        :imagePosition="imagePosition"
      />
    </template>

    <template
      v-else
    >
      <img
        class="image"
        :src="imageUrl"
        :alt="imageHeadline"
      />
    </template>
  </div>
</template>

<script>
import ParallaxScrollingImage from '../components/ParallaxScrollingImage';

export default {
  name: 'ImageComponent',
  components: {
    ParallaxScrollingImage
  },

  props: {
    imageUrl: {
      type: String,
      required: true
    },
    imageHeadline: {
      type: String,
      required: false
    },
    imageText: {
      type: String,
      required: false,
      default: ''
    },
    backgroundImageUrl: {
      type: String,
      required: false,
      default: ''
    },
    imageHeight: {
      type: String,
      required: true
    },
    imagePosition: {
      type: String,
      required: false
    }
  },
}
</script>

<style lang="scss">
.image-component {
  .image {
    display: block;
    width: 100%;
    height: auto;
  }
}
</style>
