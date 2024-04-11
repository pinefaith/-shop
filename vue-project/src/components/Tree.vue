<link rel="stylesheet" href="../Mechanical-Industrial-Products-Mall-css/mall.css">
<template>
  <li v-if="isBackendValueAllowed(data.id)">
    <a href=""> {{ data.sort_name }} {{data.id}}</a>
    <i class="iconfont">&#xe63c;</i>
    <Tree v-for="child in data.children" :key="child.id" :data="child"/>
  </li>
  <div class="slide-list" v-if="!isBackendValueAllowed(data.id)">
    <ul v-if="data.children && data.children.length>0">
      <li>-->
        <a href="">
          <span>{{data.sort_name}}</span>
        </a>
      </li>
      <Tree v-for="child in data.children" :key="child.id" :data="child"/>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Tree', // 递归组件需要设置 name 属性，才能在模板中调用自己
  props:['data'],
  data(){
    return{
      allowedValues:[0,10094,10095,10096,10097,
        10098,10099,10100,10101,10102,10103,10104]
    }
  },
  methods:{
    isBackendValueAllowed(backendValue) {
      return this.allowedValues.includes(backendValue);
    }
  },
};
</script>

<style>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>