<template>
  <div>
    <Header></Header>
    <Search></Search>
    <hr>
    <div id="details">
      <!-- 头部 -->
      <div class="page-header">
        <div class="title">
          <p>{{product && product.product_name}}</p>
          <div class="list">
            <ul>
              <li>
                <router-link to>概述</router-link>
              </li>
              <li>
                <router-link to>参数</router-link>
              </li>
              <li>
                <router-link to>用户评价</router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 头部END -->

      <!-- 主要内容 -->
      <div class="main">
        <!-- 左侧商品轮播图 -->
        <div class="block">
          <div v-if="product">
            <img
                class="block-img"
                :src="getImageUrl(product.image_url)"
                alt=""
            />
          </div>
        </div>
        <!-- 左侧商品轮播图END -->

        <!-- 右侧内容区 -->
        <div class="content">
          <h1 class="name">{{product.product_name}}</h1>
          <p class="message">{{product.message}}</p>
          <div class="pro-list">
            <span class="pro-name">{{product.product_name}}</span>
            <span class="pro-price">
              <span>{{product.price}}元</span>
            </span>
            <p class="price-sum">总计 : {{product.price*quantity}}元</p>
            <p class="stock">库存: {{product.stock}}</p>
            <div class="pro-num" v-if="product.stock > 0">
              <!-- 商品数量输入框 -->
              <el-input-number
                  size="small"
                  v-model="quantity"
                  :min="1"
                  :max="product.stock"
              ></el-input-number>
            </div>
            <div v-else>
              <div class="pro-num">
                库存不足
              </div>
            </div>
          </div>
          <!-- 内容区底部按钮 -->
          <div class="button">
            <el-button class="shop-cart" :disabled="dis" @click="addShoppingCart">加入购物车</el-button>
            <el-button class="like" :disabled="dis" @click="addPrefer">收藏</el-button>
            <el-button class="pay" @click="goToPay">立即购买</el-button>

          </div>
          <!-- 内容区底部按钮END -->
          <div class="pro-policy">
            <ul>
              <li>
                <i class="el-icon-circle-check"></i> 官方自营
              </li>
              <li>
                <i class="el-icon-circle-check"></i> 官方发货
              </li>
              <li>
                <i class="el-icon-circle-check"></i> 7天无理由退货
              </li>
              <li>
                <i class="el-icon-circle-check"></i> 7天价格保护
              </li>
            </ul>
          </div>
        </div>
        <!-- 右侧内容区END -->
      </div>
      <!-- 主要内容END -->
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Header from "@/components/Header.vue";
import Search from "@/components/Search.vue";
import { ElMessage } from "element-plus";
export default {
  name: "ProductDetail",
  props:['id'],
  data(){
    return {
      product: {
        product_name:'',
        message:'',
        price:'',
        image_url:'',
        stock:'',
      },
      quantity:1,
      confirmAddress: "", // 选择的地址id,默认第一个
      addresses: [],// 地址列表
      selectedItems:[]
    }
  },
  created() {
    this.fetchProductDetails()
    const user = sessionStorage.getItem('user');
  },
  watch: {
    quantity(newValue) {
      if (this.selectedItems.length > 0) {
        this.selectedItems[0].quantity = newValue;
      }
    },
  },
  components:{
    Header,
    Search
  },
  methods:{
    getImageUrl(imagePath) {
      return '/public/image/' + imagePath;
    },
    fetchProductDetails() {
      const productId = this.$route.params.id
      axios
          .get("http://localhost:9991/product/Product/"+productId)
          .then(response=>{
            this.product = response.data
            this.selectedItems[0] = {
              ...this.product,
              product_id:this.product.id,
              quantity: this.quantity, // 添加quantity属性并绑定到本页面的quantity
            };
            console.log(this.selectedItems[0])
          })
          .catch(err=>{
            console.log(err)
          })
    },
    addShoppingCart(){
      const user = sessionStorage.getItem('user');
      console.log(user)
      if (user) {
        // 用户已登录，执行加入购物车的逻辑
        //先判断库存是否足够
        if(this.product.stock<this.quantity){
          this.$message({
            type: "warning",
            message: "库存不足！！！"
          })
        }else{
          axios
              .post("http://localhost:9991/cart/cart/addShoppingCart", {
                user_id: JSON.parse(sessionStorage.getItem('user')).id,
                product_id: this.$route.params.id,
                quantity:this.quantity
              })
              .then(res => {
                this.$message({
                  type: "success",
                  message: "加入成功"
                })
                window.location.reload()
              })
        }
      } else {
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    },
    goToPay(){
      const user = sessionStorage.getItem('user');
      console.log(user)
      if (user) {
        // 用户已登录，执行加入购物车的逻辑
        //先判断库存是否足够
        if(this.product.stock<this.quantity){
          this.$message({
            type: "warning",
            message: "库存不足！！！"
          })
        }else{
          this.$router.push({
            path: '/confirmOrder',
            query: { items: JSON.stringify(this.selectedItems)  } // 参数对象
          });
        }
      }else{
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    },
    addPrefer(){
      const user = sessionStorage.getItem('user');
      console.log(user)
      if (user) {
        // 用户已登录，执行加入收藏的逻辑
        //先判断库存是否足够

        axios
            .post("http://localhost:9991/order/prefer/addPrefer", {
              user_id: JSON.parse(sessionStorage.getItem('user')).id,
              product_id: this.$route.params.id,
            })
            .then(res => {
              this.$message({
                type: "success",
                message: "加入成功"
              })
              window.location.reload()
            })
      }
      else {
        // 用户未登录，跳转到登录页面
        this.$message({
          type: "success",
          message: "请先登录"
        })
        this.$router.push("/login")
      }
    },
  }
}
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
@import "../Mechanical-Industrial-Products-Mall-css/productDetail.css";
</style>