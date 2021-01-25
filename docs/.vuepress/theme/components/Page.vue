<template>
  <main class="page">
    <slot name="top" />
    <Content
      class="theme-default-content"
      :class="classObject"
    />
    <PageEdit />

    <PageNav v-bind="{ sidebarItems }" />

    <slot name="bottom" />
  </main>
</template>

<script>
import imageComponent from '../global-components/ImageComponent';
import PageEdit from '@theme/components/PageEdit.vue'
import PageNav from '@theme/components/PageNav.vue'

export default {
  name: 'Page',
  components: {
    PageEdit,
    PageNav,
    imageComponent
  },

  props: {
    sidebarItems: {
      type: Array,
      required: false
    },
    pageType: {
      type: String,
      required: false,
      default: ''
    }
  },

  computed: {
    classObject() {
      return {
        'custom': this.pageType === 'custom'
      }
    },

    backgroundImage() {
      return typeof this.$frontmatter.imageBackground !== 'undefined' ? this.$frontmatter.imageBackground : null;
    }
  }
}
</script>

<style lang="scss">
@import '../styles/wrapper.scss';
@import '../styles/variables.scss';

.page {
  display: block;
  margin-top: $navbarHeight;
  padding-bottom: 2rem;
}
</style>
