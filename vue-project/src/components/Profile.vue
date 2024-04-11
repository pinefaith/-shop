<template>
  <el-container class="home-container">
    <!--头部区域-->
    <el-header>
      <div style="display:flex;align-items: center">
        <img src="/public/logo.png" alt="" class="logo">
        <span>&nbsp&nbsp&nbsp&nbsp个人中心</span>
      </div>
      <el-button type="info" @click="goToMainPage">退出</el-button>
    </el-header>
    <!--页面主体区域-->
    <el-container>
      <!--侧边栏-->
      <el-aside width="200px">
        <!--侧边栏菜单区域-->
        <el-menu background-color="#FFFFFF" text-color="#000000"
                 active-text-color="#ffd04b" :router="true">
          <el-menu-item index="Information">
            <i class="el-icon-menu"></i>
            <span slot="title">我的信息</span>
          </el-menu-item>
          <el-menu-item index="Address">
            <i class="el-icon-document"></i>
            <span slot="title">地址管理</span>
          </el-menu-item>
          <el-menu-item index="orderList">
            <i class="el-icon-setting"></i>
            <span slot="title">订单管理</span>
          </el-menu-item>
          <el-menu-item index="prefer">
            <i class="el-icon-setting"></i>
            <span slot="title">我喜欢</span>
          </el-menu-item>
          <el-menu-item index="cart">
            <i class="el-icon-setting"></i>
             <span slot="title">购物车</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <!--右侧内容主体-->
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import '../assets/global.css'
export default {
  data() {
    return {

    }
  },
  methods:{
    goToMainPage(){
      this.$router.push('/')
    }
  }
};
</script>

<style  scoped>
.logo{
  height: 60px;
  width: 60px;
}
.home-container{
  height: 100%;
}
.el-header{
  /*background-color: #373d41;*/
  display: flex;
  justify-content: space-between;
  padding-left: 0;
  align-items: center;
  background: linear-gradient(90deg, #4ebcc3 0%, #009ea6 73%, #009ddb 100%);
  box-shadow: 0 3px 3px #eee;
  color: #fffdef;
  font-size: 20px;

}
.el-aside{
  background-color: #FFFFFF;
}
.el-main{
  background-color: #eaedf1;
}


</style>