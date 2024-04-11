<template>
  <div>
    <Header></Header>
    <hr>
    <div class="xtx-pay-page">
      <div class="container">
        <!-- 支付结果 -->
        <div class="pay-result">
          <!-- 路由参数获取到的是字符串而不是布尔值 -->
          <span class="iconfont icon-queren2 green" v-if="$route.query.payResult === 'true'"></span>
          <span class="iconfont icon-shanchu red" v-else></span>
          <p class="tit">支付成功</p>
          <p class="tip">我们将尽快为您发货，收货期间请保持手机畅通</p>
          <p>支付方式：<span>支付宝</span></p>
          <p>支付金额：<span>¥{{ total_amount }}</span></p>
          <div class="btn">
            <el-button @click="goToHome">进入首页</el-button>
          </div>
          <p class="alert">
            <span class="iconfont icon-tip"></span>
            温馨提示：机械工业品商城不会以订单异常、系统升级为由要求您点击任何网址链接进行退款操作，保护资产、谨慎操作。
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Header from "@/components/Header.vue";
import axios from "axios";
import {ElMessage} from "element-plus";
export default {
  data(){
    return{
      user:{},
      account: '',
      password: '',
      total_amount:'',
      form: {
        account:this.account,
        password:this.password,

      },
    }
  },
  components:{
    Header,
  },
  created() {
    // 从路径中获取用户名和密码
    this.account = this.$route.query.account;
    this.password = this.$route.query.password;
    this.total_amount = this.$route.query.total_amount;
    this.login()
  },
  methods:{
    login() {
      axios
          .post("http://localhost:9991/user/User/login", {
            account:this.account,
            password:this.password
          })
          .then(response => {
            console.log(response)
            console.log(response.data.password)
            // 将用户信息存储到sessionStorage中
            sessionStorage.setItem('user', JSON.stringify(response.data));
            const user_id = JSON.parse(sessionStorage.getItem('user'))
            console.log(user_id)
          })
          .catch(error => {

          });
    },
    goToHome() {
      let that = this
      that.$router.push({ name: 'Home' });
    },
  }
}
</script>
<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.pay-result {
  text-align: center;
  padding: 40px;
  background-color: #f7f7f7;
  border-radius: 4px;
}

.green {
  font-size: 60px;
  color: #67c23a;
}

.red {
  font-size: 60px;
  color: #f56c6c;
}

.tit {
  font-size: 24px;
  margin-top: 20px;
}

.tip {
  font-size: 16px;
  color: #909399;
  margin: 10px 0;
}

p {
  font-size: 14px;
  margin-bottom: 8px;
}

p span {
  font-weight: bold;
}

.btn {
  margin-top: 20px;
}

.alert {
  font-size: 12px;
  color: #909399;
  margin-top: 40px;
  line-height: 20px;
}

.icon-tip {
  font-size: 16px;
  margin-right: 4px;
}
</style>