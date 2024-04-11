<template>
  <div>
    <div class="shoppingCart">
      <!-- 购物车头部 -->
      <div class="cart-header">
        <div class="cart-header-content">
          <p>
            <i class="el-icon-shopping-cart-full" style="color:#ff6700; font-weight: 600;"></i>
            我的收藏
          </p>
          <span>温馨提示：喜欢商品库存有限，请尽快购买</span>
        </div>
      </div>
      <!-- 购物车头部END -->

      <!-- 购物车主要内容区 -->
      <div class="content">
        <ul>
          <!-- 购物车表头 -->
          <li class="header">
            <div class="pro-img">商品图片</div>
            <div class="pro-name">商品名称</div>
            <div class="pro-price">单价</div>
            <div class="pro-action">操作</div>
          </li>
          <!-- 购物车表头END -->
          <!-- 购物车列表 -->
          <li class="product-list" v-for="(item,index) in shoppingCart" :key="item.id">
            <div class="pro-img">
              <router-link :to="{ path: '/Product/'+item.id }">
                <img :src="getImageUrl(item.image_url)" />
              </router-link>
            </div>
            <div class="pro-name pro-name-text">
              <router-link
                  :to="{ path: '/Product/'+item.id }"
              >{{item.product_name}}</router-link>
            </div>
            <div class="pro-price pro-name-text">{{item.price}}元</div>
            <div class="pro-action">
              <el-popconfirm
                  confirm-button-text="确定"
                  cancel-button-text="取消"
                  :icon="InfoFilled"
                  icon-color="#626AEF"
                  title="确定删除吗?"
                  @confirm="deleteCartItem(item.id)"
              >
                <template #reference>
                  <el-button>删除</el-button>
                </template>
              </el-popconfirm>
            </div>
          </li>
          <!-- 购物车列表END -->
        </ul>
        <div style="height:20px;background-color: #f5f5f5"></div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Header from "@/components/Header.vue";
import Search from "@/components/Search.vue";
import Footer from "@/components/Footer.vue";
import { ElMessage } from "element-plus";
import { ElInputNumber } from "element-plus";
export default {
  name: "Vue",
  data(){
    return {
      isAllCheck:false,
      isChecked:false,
      shoppingCart:[],
      selectedItems: [], // 存储选中的商品
      totalPrice: 0, // 合计金额
      selectedItemIds: [], // 选中的购物车项 ID
    }
  },
  components:{
    Header,
    Search,
    Footer,
    ElInputNumber,
  },
  created() {
    this.fetchCartList()
  },
  methods:{
    fetchCartList() {
      const user_id = JSON.parse(sessionStorage.getItem('user')).id
      axios
          .get("http://localhost:9991/product/prefer/showAll/"+user_id)
          .then(res=>{
            console.log(res)
            this.shoppingCart = res.data.data
            console.log(this.shoppingCart)
          })
          .catch(err=>{
            console.log(err)
          })
    },
    getImageUrl(imagePath) {
      return '/public/image/' + imagePath;
    },
    // 更新选中商品的数量和合计金额
    updateSelectedItems() {
      this.selectedItems = this.shoppingCart.filter(item => item.check);
      this.selectedItemIds = this.selectedItems.map(item => item.id);
      this.totalPrice = this.selectedItems.reduce(
          (total, item) => total + item.price * item.quantity,
          0
      );
      //如果全部取消时，全选按钮也取消
      if (this.selectedItems.length === 0) {
        this.isAllCheck = false;
      }
    },
    //全选
    selectAll(checked) {
      this.shoppingCart.forEach(item => {
        if (item.stock > 0) {
          item.check = checked;
        }
      });
      this.updateSelectedItems();
    },
    //删除购物车我中的商品
    deleteCartItem(id){
      axios
          .delete("http://localhost:9991/product/prefer/deletePreferItem/"+id)
          .then(res => {
            // this.fetchCartList()
            this.fetchCartList()
          })
          .catch(err => {
            return Promise.reject(err);
          });
    }
  }
}
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
.shoppingCart {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}
/* 购物车头部CSS */
.shoppingCart .cart-header {
  height: 64px;
  border-bottom: 2px solid #ff6700;
  background-color: #fff;
  margin-bottom: 20px;
}
.shoppingCart .cart-header .cart-header-content {
  width: 1225px;
  margin: 0 auto;
}
.shoppingCart .cart-header p {
  font-size: 28px;
  line-height: 58px;
  float: left;
  font-weight: normal;
  color: #424242;
}
.shoppingCart .cart-header span {
  color: #757575;
  font-size: 12px;
  float: left;
  height: 20px;
  line-height: 20px;
  margin-top: 30px;
  margin-left: 15px;
}
/* 购物车头部CSS END */

/* 购物车主要内容区CSS */
.shoppingCart .content {
  width: 1225px;
  margin: 0 auto;
  background-color: #fff;
}

.shoppingCart .content ul {
  background-color: #fff;
  color: #424242;
  line-height: 85px;
}
.shoppingCart .content ul li{
  display: flex;
  justify-content: space-between;
}
/* 购物车表头及CSS */
.shoppingCart .content ul .header {
  height: 85px;
  padding-right: 26px;
  color: #424242;
}
.shoppingCart .content ul .product-list {
  height: 85px;
  padding: 15px 26px 15px 0;
  border-top: 1px solid #e0e0e0;
}
.shoppingCart .content ul .pro-check {
  float: left;
  height: 85px;
  width: 110px;
}
.shoppingCart .content ul .pro-check .el-checkbox {
  font-size: 16px;
  margin-left: 24px;
}
.shoppingCart .content ul .pro-img {
  float: left;
  height: 85px;
  width: 120px;
  font-size: 18px;
}
.shoppingCart .content ul .pro-img img {
  height: 80px;
  width: 80px;
}
.shoppingCart .content ul .pro-name {
  float: left;
  width: 380px;
  font-size: 18px;
}
.shoppingCart .content ul .pro-name a {
  color: #424242;
}
.shoppingCart .content ul .pro-name a:hover {
  color: #ff6700;
}
.shoppingCart .content ul .pro-name-text {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.shoppingCart .content ul .pro-price {
  float: left;
  width: 140px;
  padding-right: 18px;
  text-align: center;
  font-size: 18px;
}
.shoppingCart .content ul .pro-num {
  float: left;
  width: 150px;
  text-align: center;
}
.shoppingCart .content ul .pro-total {
  float: left;
  width: 120px;
  padding-right: 81px;
  text-align: right;
}
.shoppingCart .content ul .pro-total-in {
  color: #ff6700;
}
.shoppingCart .content ul .pro-action {
  float: left;
  width: 80px;
  font-size: 18px;
  text-align: center;
}
.shoppingCart .content ul .pro-action i:hover {
  color: #ff6700;
}
/* 购物车表头及CSS END */

/* 购物车底部导航条CSS */
.shoppingCart .cart-bar {
  width: 1225px;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
}
.shoppingCart .cart-bar .cart-bar-left {
  float: left;
}
.shoppingCart .cart-bar .cart-bar-left a {
  line-height: 50px;
  margin-left: 32px;
  color: #757575;
}
.shoppingCart .cart-bar .cart-bar-left a:hover {
  color: #ff6700;
}
.shoppingCart .cart-bar .cart-bar-left .sep {
  color: #eee;
  margin: 0 20px;
}
.shoppingCart .cart-bar .cart-bar-left .cart-total {
  color: #757575;
}
.shoppingCart .cart-bar .cart-bar-left .cart-total-num {
  color: #ff6700;
}
.shoppingCart .cart-bar .cart-bar-right {
  float: right;
}
.shoppingCart .cart-bar .cart-bar-right .total-price-title {
  color: #ff6700;
  font-size: 14px;
}
.shoppingCart .cart-bar .cart-bar-right .total-price {
  color: #ff6700;
  font-size: 30px;
}
.shoppingCart .cart-bar .cart-bar-right .btn-primary {
  float: right;
  width: 200px;
  text-align: center;
  font-size: 18px;
  margin-left: 50px;
  background: #ff6700;
  color: #fff;
}
.shoppingCart .cart-bar .cart-bar-right .btn-primary-disabled {
  float: right;
  width: 200px;
  text-align: center;
  font-size: 18px;
  margin-left: 50px;
  background: #e0e0e0;
  color: #b0b0b0;
}
.shoppingCart .cart-bar .cart-bar-right .btn-primary:hover {
  background-color: #f25807;
}
/* 购物车底部导航条CSS END */
/* 购物车主要内容区CSS END */

/* 购物车为空的时候显示的内容CSS */
.shoppingCart .cart-empty {
  width: 1225px;
  margin: 0 auto;
}
.shoppingCart .cart-empty .empty {
  height: 300px;
  padding: 0 0 130px 558px;
  margin: 65px 0 0;
  background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
  color: #b0b0b0;
  overflow: hidden;
}
.shoppingCart .cart-empty .empty h2 {
  margin: 70px 0 15px;
  font-size: 36px;
}
.shoppingCart .cart-empty .empty p {
  margin: 0 0 20px;
  font-size: 20px;
}
/* 购物车为空的时候显示的内容CSS END */
</style>