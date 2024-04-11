<template>
  <div>
    <!--面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>个人中心</el-breadcrumb-item>
      <el-breadcrumb-item>地址管理</el-breadcrumb-item>
    </el-breadcrumb>

    <!--卡片视图区域-->
    <el-card>
      <!--搜索与添加区域-->
      <el-row :gutter="20">
<!--        <el-col :span="8">-->
<!--          <el-input placeholder="请输入内容"> </el-input>-->
<!--        </el-col>-->
        <el-col :span="4">
          <el-button type="primary" @click="addAddress1">增加地址</el-button>
        </el-col>
      </el-row>
    </el-card>

    <el-main>

      <el-table :data='Address'>
<!--        <el-table-column prop="id" label="id"></el-table-column>-->
<!--        <el-table-column prop="user_id" label="用户编号"></el-table-column>-->
        <el-table-column prop="name" label="姓名"></el-table-column>
        <el-table-column prop="phone" label="电话"></el-table-column>
        <el-table-column prop="addr" label="详细地址"></el-table-column>
        <el-table-column prop="操作">
          <template #default="scope">
            <el-button type="primary" @click="deleteAddress(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

    </el-main>

    <el-dialog title="新增地址" v-model="dialogVisible" style="width: 500px;">
      <el-form :model="form" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone"></el-input>
        </el-form-item>
        <el-form-item label="详细地址" prop="addr">
          <el-input v-model="form.addr"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" >
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import axios from "axios";

export default {
  data(){
    return {
      Address:[],
      form:{
        id:'',
        user_id:'',
        // account:'',
        name:'',
        // password:'',
        phone:'',
        // sex:'',
        addr:'',
      },
      dialogVisible: false,
    }
  },
  mounted() {
    this.fetchData();
    // const user =JSON.parse(sessionStorage.getItem('user'))
    // axios
    //     .get("http://localhost:9991/Address/findAddressById?id="+user.id)
    //     .then(response => {
    //       const  that = this
    //       console.log(response)
    //       console.log(response.data)
    //       that.Address = response.data
    //     })
    //     .catch(error => {
    //       console.log(error);
    //     });
  },
  methods: {
    submitForm(){
      // this.$axios.post("http://localhost:9991/Address", this.form)
      //     .then(() => {
      //       this.$message.success('地址添加成功！');
      //       this.fetchData();
      //     })
      //     .catch(() => {
      //       this.$message.error('添加失败，请重试！');
      //     })

      // 发送表单数据到后台，进行新增操作
      axios.post("http://localhost:9991/address/Address/addAddress",{
        user_id:JSON.parse(sessionStorage.getItem('user')).id,
        name:this.form.name,
        phone:this.form.phone,
        addr:this.form.addr
      }).then(response => {
        // 处理成功响应
        console.log(response);
        this.fetchData()
      }).catch(error => {
        // 处理错误响应
        console.error(error);
      });
      // 关闭对话框
      this.dialogVisible = false;
    },
    addAddress1() {
      this.dialogVisible = true;
      // this.$axios.post("http://localhost:9991/Address", this.form)
      //     .then(() => {
      //       this.$message.success('地址添加成功！');
      //       this.fetchData();
      //     })
      //     .catch(() => {
      //       this.$message.error('添加失败，请重试！');
      //     })
    },
    fetchData(){
      const user =JSON.parse(sessionStorage.getItem('user'))
      axios
          .get("http://localhost:9991/address/Address/findAddressById?id="+user.id)
          .then(response => {
            const  that = this
            console.log(response)
            console.log(response.data)
            that.Address = response.data
          })
          .catch(error => {
            console.log(error);
          });
    },
    deleteAddress(row) {
      axios.delete("http://localhost:9991/address/Address/deleteAddress/"+ row.id)
          .then((response) => {
            console.log(response.data);
            this.fetchData()
            // 处理删除成功后的逻辑
          })
          .catch((error) => {
            console.log(error);
            // 处理删除失败后的逻辑
          });
    }
  },
}
</script>


<style scoped>


</style>