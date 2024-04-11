<template>
  <div>
    <!--面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>个人中心</el-breadcrumb-item>
      <el-breadcrumb-item>我的信息</el-breadcrumb-item>
    </el-breadcrumb>

    <!--卡片视图区域-->
    <el-card>
    <!--搜索与添加区域-->
      <el-row :gutter="20">
<!--        <el-col :span="8">-->
<!--          <el-input placeholder="请输入内容"> </el-input>-->
<!--        </el-col>-->
        <el-col :span="4" slot-scope="scope">
          <el-button type="primary" @click="updateUser">修改信息</el-button>
        </el-col>
      </el-row>
    </el-card>

    <el-main>
      <el-form ref="form" :model="form" label-width="80px" style="width: 300px;">
        <el-form-item label="账号">
          <el-input v-model="form.account"></el-input>
        </el-form-item>
        <el-form-item label="姓名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="电话">
        <el-input v-model="form.phone"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.sex">
            <el-radio model-value="男" label="男"></el-radio>
            <el-radio model-value="女" label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
    </el-main>
  </div>
</template>

<script>
import axios from "axios";

export default {
  mounted() {
    const user =JSON.parse(sessionStorage.getItem('user'))

    axios
        .get("http://localhost:9991/user/User/findById?id="+user.id)
        .then(response => {
          const that = this
          console.log(response)
          console.log(response.data)
          that.form = response.data
        })
        .catch(error => {
          console.log(error);
        });
  },
  data(){
    return {
      user:{},
      form:{
        id:'',
        account:'',
        name:'',
        password:'',
        phone:'',
        sex:'',
      }
    }
  },
  methods:{
    updateUser() {
      const user =JSON.parse(sessionStorage.getItem('user'))
      // 提交更新用户信息的 PUT 请求
      axios.put("http://localhost:9991/order/User/Update",{
        id:this.form.id,
        account:this.form.account,
        name:this.form.name,
        password:this.form.password,
        phone:this.form.phone,
        sex:this.form.sex
      })
          .then(res => {
            // 提交成功后处理返回结果
            console.log('update user success:', res.data);
          })
          .catch(error => {
            console.log('update user failed', error);
          });
    }
  }
}

</script>

<style scoped>

</style>