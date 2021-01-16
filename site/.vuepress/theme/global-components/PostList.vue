<template>
  <div class="post-list">
    <template
      v-for="(postListItem, index) in articlesList"
    >
      <post-list-item
        :key="'post-list-' + index"
        :post-data="postListItem"
      />
    </template>
  </div>
</template>

<script>
import postListItem from '../components/PostListItem';

export default {
  name: 'PostList',
  components: {
    postListItem
  },

  computed: {
    articlesList() {
      const completePagesList = this.$site.pages;
      const currentCategory = this.$page.frontmatter.categoryIndex;
      let articlesList = [];

      completePagesList.forEach(item => {
        if (item.frontmatter.category === currentCategory) {
          articlesList.push(item);
        }
      });

      return articlesList;
    }
  }
}
</script>
