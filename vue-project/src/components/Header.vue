<template>
  <div class="header">
    <div class="wrap">
      <ul class="header-left">
        <li><a href="#">欢迎来到机械工业品商城</a><span>|</span></li>
        <li>
          <a href="#">下载app</a><span>|</span>
          <div class="download">
            <a href="">
              <img src="../Mechanical-Industrial-Products-Mall-images/code.jpg" alt="">
              <p>机械商城APP</p>
            </a>
          </div>
        </li>
      </ul>
      <ul class="header-right">
        <li><a href="#" @click="goToLogin">{{ user.account }}</a><span>|</span></li>
        <router-link to="Profile">
          <li><a href="#">个人中心</a><span>|</span></li>
        </router-link>
        <li><a href="#">消息通知</a><span>|</span></li>
        <li><a href="#" @click="goToMyOrder">我的订单</a><span>|</span></li>
        <li><a href="#" @click="goToMyPrefer">我的收藏</a></li>
        <li class="cart">
          <a href="#" @click="goToCart"><i class="iconfont">&#xe70b;</i>购物车({{ cardNum }})</a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Header",
  data() {
    return {
      user: {},
      cartItems: [],  // 初始化一个空数组用于存储购物车商品数据
      cardNum:0
    }

  },
  methods:{
    goToLogin(){
      let that = this
      that.$router.push({path:'/login'})
    },
    fetchCart() {
      const user_id = JSON.parse(sessionStorage.getItem('user')).id
      // 发起API请求，获取用户购物车商品
      // 假设后端返回的数据为cartData
      const cartData = axios
          .get("http://localhost:9991/cart/cart/getProductNum/"+user_id)
          .then(res=>{
            // console.log(res)
            this.cardNum = res.data.data
          })
          .catch(err=>{
            console.log(err)
          })
    },
    goToCart() {
      const user = sessionStorage.getItem('user');
      if(user){
        this.$router.push({ path: '/cart' });
      }else{
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    },
    goToMyOrder(){
      const user = sessionStorage.getItem('user');
      if(user){
        this.$router.push({ path: '/orderList' });
      }else{
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    },
    goToMyPrefer(){
      const user = sessionStorage.getItem('user');
      if(user){
        this.$router.push({ path: '/prefer' });
      }else{
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    }
  },
  created() {
    const user = sessionStorage.getItem('user');
    if (user) {
      this.user = JSON.parse(user);
      this.fetchCart();
    } else {
      this.user = { account: '登录' };
    }
  },
}
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>