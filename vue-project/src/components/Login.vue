<template>
  <div class="top">
    <div class="topleft"></div>
    <div class="topright">欢迎登录</div>
  </div>
  <div class="maxbg">
    <div class="logo">
      <img  src="/public/logo.png">
    </div>
    <div class="entry">
      <div>
        <span class="left">机械会员</span>
        <span @click="swapContent" class="right"><a href="javascript:void(0)"  @click="toggleComponent" >{{ content }}</a></span>
      </div>
      <component :is="currentComponent" />
    </div>
  </div>
  <div class="bottoms">
    <div class="tet">
      <p>关于我们 | 联系我们 | 人才招聘 | 商家入驻 | 广告服务 | 机械商城 | 友情链接 | 销售联盟 | 商城社区 | 机械公益 | English Site</p>
    </div>
    <div class="txt">
      <p>Copyright&copy;2022-2023 烟大YTU.com 版权所有</p>
    </div>
  </div>

</template>
<script>
import LoginList from "@/components/LoginList.vue";
import Register from "@/components/Register.vue";
import axios from "axios";
import { mapState } from 'vuex'
import store from '../store.js'
export default {
  name:'Login',
  components:{
    LoginList,
    Register
  },
  computed: {
    currentComponent() {
      return store.state.currentComponent
    }
  },
  data(){
    return{
      content: '立即注册',
    }
  },
  methods:{
    toggleComponent () {
      store.commit('updateComponent', this.currentComponent === 'LoginList' ? 'Register' : 'LoginList')
    },
    swapContent() {
      if (this.content === '立即注册') {
        this.content = '返回登录';
      } else {
        this.content = '立即注册';
      }
    },
  }
}
</script>
<style scoped>
  @import "../assets/login.css";
</style>