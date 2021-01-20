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
import PageEdit from '@theme/components/PageEdit.vue'
import PageNav from '@theme/components/PageNav.vue'

export default {
  name: 'Page',
  components: { PageEdit, PageNav },

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

.page {
  padding-bottom: 2rem;
  display: block;
}
</style>
