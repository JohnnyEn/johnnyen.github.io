<template>
  <div @click="pushArticlePath(postData.path)">
    <h3>{{ postData.frontmatter.title }}</h3>
    <p>{{ postData.frontmatter.description }}</p>
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

  methods: {
    pushArticlePath(postPath) {
      this.$router.push({ path: postPath });
    }
  }
}
</script>
