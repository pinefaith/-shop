<template>
  <div class="nav">
    <div class="wrap">
      <div class="logo">
        <a href="#">
          <img src="../Mechanical-Industrial-Products-Mall-images/logo.png" alt="">
        </a>
      </div>
      <div class="search">
        <input type="text" v-model="searchText" placeholder="欢迎选购建筑机械">
        <button type="button" class="iconfont">
          <router-link :to="`/search/searchResult/${1}/${searchText}`">
            &#xe6e4;
          </router-link>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import {defineComponent, ref, watch} from 'vue';

export default defineComponent({
  name: 'Search',
  setup() {
    const searchText = ref('');
    const searchResults = ref([]);

    return {
      searchText,
      searchResults,
    };
  },
});
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>