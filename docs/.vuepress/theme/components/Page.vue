<template>
  <main class="page">
    <slot name="top" />
      <client-only>
        <image-component
          :imageUrl="$frontmatter.image"
          imageHeight="300"
        />
      </client-only>

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
