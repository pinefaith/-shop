<template>
  <form>
    <div>
      <input type="text" class="username" v-model="form.account" placeholder="请输入账号">
      <input type="password" class="username" v-model="form.password" placeholder="请输入密码">
    </div>
    <div class="captcha">
      <input class="userpwd" type="text" v-model="captcha" placeholder="请输入验证码">
      <img :src="captchaUrl" class="pic" alt="captcha" @click="refreshCaptcha">
    </div>
    <div class="litlebox">
      <span class="login"><input type="checkbox"> 自动登录</span>
      <span class="password">忘记密码？</span>
    </div>
    <div class="DengLu">
     <input type="submit" @click.prevent="Login" value="登录" class="denglu">
    </div>
  </form>
</template>

<script>
import axios from 'axios'
import {defineComponent } from 'vue'
import {ElMessage} from "element-plus";
// import md5 from 'md5';

export default defineComponent({
  name:'LoginList',
  data(){
    return{
      form: {
        account:'',
        password:'',

      },
      message: '',
      captcha: '',
      captchaUrl: '',
      captcha1:''
    }
  },
  created() {
    // 在页面加载时读取sessionStorage中的用户信息
      const user = sessionStorage.getItem('user');
    if (user) {
      this.goToHome();
    }
  },
  methods:{
    Login(){
      if (this.form.account === '') {
        ElMessage.error('请输入账号');
        return;
      }
      if (this.form.password === '') {
        ElMessage.error('请输入密码');
        return;
      }
      if (this.captcha.toUpperCase() === this.captcha1.toUpperCase() ){
        axios
            .post("http://localhost:9991/user/User/login", this.form,{
              headers: {
                'Content-Type': 'application/json;charset=UTF-8'
              }})

            .then(response => {
              // this.message = response.data;
              // console.log(message)
              // response.data.password = md5(response.data.password)
              console.log(response.data)
              console.log(response)

              if(response.data === ""){
                ElMessage.error("账号或密码错误");
              }else {
                ElMessage.success("登录成功");
                // 将用户信息存储到sessionStorage中
                sessionStorage.setItem('user', JSON.stringify(response.data));
                this.goToHome();}
            })
        // .catch(error => {
        //   // this.message = error.response.data;
        //   ElMessage.error(error.response.data);
        //   this.captcha = "";
        //   // ElMessage.error('注册失败，用户名已存在');
        //   this.refreshCaptcha();
        // });
      }
      else {
        this.captcha = "";
        ElMessage.error("验证码错误");
        this.refreshCaptcha();
      }
    },
    goToHome() {
      let that = this
      that.$router.push({ name: 'Home' });
    },
    refreshCaptcha() {
      axios.get("https://www.mxnzp.com/api/verifycode/code?len=5&type=0&app_id=sdnppmgjtnrcieec&app_secret=RDFhWXhTeCsraUlDUk1kK2RnLzk3dz09")
          .then(response => {
            const data = response.data.data;
            this.captchaUrl=data.verifyCodeImgUrl
            this.captcha1 = data.verifyCode
          }).catch(error => {
        console.log(error);
      });
    }
  }, mounted() {
    this.refreshCaptcha()
  }
})
</script>
<style scoped>
@import "../assets/register.css";
</style>