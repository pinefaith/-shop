<template>
  <form>
    <div>
      <input type="text" class="username" v-model="form.account" placeholder="请输入您的账号">
      <input type="text" class="userpwd" v-model="form.name" placeholder="请输入您的姓名">
      <select v-model="form.sex"  >
        <option value="男">男</option>
        <option value="女">女</option>
      </select>
      <input type="password" class="username" v-model="form.password" placeholder="请输入密码">
      <input type="text" class="username" v-model="form.phone" placeholder="请输入电话">

    </div>
    <div class="DengLu">
      <a href="#">
        <input type="submit" value="提交" @click.prevent="onSubmit" class="denglu">
      </a>
    </div>
    <div v-if="message">{{ message }}</div>
  </form>
</template>

<script>
import axios from 'axios'
import { defineComponent } from 'vue'
import {ElMessage} from "element-plus";
// import CryptoJS from 'crypto-js';

export default defineComponent({
  name: 'Register',
  data() {
    return {
      form: {
        account: '',
        name:'',
        password: '',
        phone:'',
        sex:'男'
      },
      message: ''
    };
  },
  methods: {
    onSubmit() {
      if (this.form.account === '') {
        ElMessage.error('请输入账号');
        return;
      }
      if (this.form.name === '') {
        ElMessage.error('请输入姓名');
        return;
      }
      if (this.form.password === '') {
        ElMessage.error('请输入密码');
        return;
      }
      if (this.form.phone === '') {
        ElMessage.error('请输入电话');
        return;
      }
      // // 对密码进行加密处理
      // this.form.password = CryptoJS.MD5(this.form.password).toString();
      axios
          .post("http://localhost:9991/user/User/register", this.form)
          .then(response => {
            // this.message = response.data;
            // console.log(message)
            // ElMessage.success(response.data);
            ElMessage.success(response.data);
          })
          .catch(error => {
            // this.message = error.response.data;
            ElMessage.error(error.response.data);
            // ElMessage.error('注册失败，用户名已存在');
          });
    }
  }
})
</script>

<style scoped>
@import "../assets/register.css";
</style>
