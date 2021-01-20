<template>
  <div
    class="post-list-item"
    @click="pushArticlePath(postData.path)"
  >
    <div
      class="post-list-item-background"
      :style="itemStyle"
    />

    <div class="post-list-item-info">
      <h3>{{ postData.frontmatter.title }}</h3>
      <p>{{ postData.frontmatter.description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PostListItem',
  props: {
    postData: {
      type: Object,
      required: true
    }
  },

  computed: {
    itemStyle() {
      return `background-image: url(${this.postData.frontmatter.image});`
    }
  },

  methods: {
    pushArticlePath(postPath) {
      this.$router.push({ path: postPath });
    }
  }
}
</script>

<style lang="scss">
.post-list-item {
  position: relative;
  width: 100%;
  height: 300px;
  overflow: hidden;
  cursor: pointer;

  .post-list-item-background {
    width: 100%;
    height: 100%;
    background-position: center;
    background-size: cover;
    transition: transform 0.2s ease-in;

    &:hover,
    &:focus {
      transform: scale(1.2);
    }
  }

  .post-list-item-info {
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    display: block;
    padding: 10px 20px;
    background: rgba(0, 0, 0, .4)
  }
}
</style>
