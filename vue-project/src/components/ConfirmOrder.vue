<template>
  <div>
    <Header></Header>
    <hr>
    <div class="confirmOrder">
      <!-- 头部 -->
      <div class="confirmOrder-header">
        <div class="header-content">
          <p>
            <i class="el-icon-s-order"></i>
          </p>
          <p>确认订单</p>
          <router-link to></router-link>
        </div>
      </div>
      <!-- 头部END -->

      <!-- 主要内容容器 -->
      <div class="content">
        <!-- 选择地址 -->
        <div class="section-address">
          <p class="title">收货地址</p>
          <div class="address-body">
            <ul>
              <li :class="item.id == confirmAddress ? 'in-section' : ''" v-for="item in addresses" :key="item.id" @click="confirmAddress = item.id">
                <h2>{{item.name}}</h2>
                <p class="phone">{{item.phone}}</p>
                <p class="address">{{item.addr}}</p>
              </li>
              <li class="add-address">
                <i class="el-icon-circle-plus-outline"></i>
                <p>添加新地址</p>
              </li>
            </ul>
          </div>
        </div>
        <!-- 选择地址END -->
        <!-- 购物车列表 -->
        <ul class="cartList" style="line-height: 85px">
          <!-- 购物车表头 -->
          <li class="header">
            <div class="pro-img" style="font-size: 20px">确认订单信息</div>
            <div class="pro-name">商品名称</div>
            <div class="pro-price">单价</div>
            <div class="pro-num">数量</div>
            <div class="pro-total">小计</div>
          </li>
          <!-- 购物车表头END -->
          <!-- 购物车列表 -->
          <li class="product-list" v-for="(item,index) in selectedItems" :key="item.id">
            <div class="pro-img">
              <img :src="getImageUrl(item.image_url)" />
            </div>
            <div class="pro-name pro-name-text">
              {{item.product_name}}
            </div>
            <div class="pro-price pro-name-text">{{item.price}}元</div>
            <div class="pro-price pro-name-text">{{item.quantity}}</div>
            <div class="pro-total pro-total-in pro-name-text">{{item.price*item.quantity}}元</div>
          </li>
          <!-- 购物车列表END -->
        </ul>
        <!-- 购物车列表END -->
        <!-- 配送方式 -->
        <div class="section-shipment">
          <p class="title">配送方式</p>
          <p class="shipment">包邮</p>
        </div>
        <!-- 配送方式END -->

        <!-- 结算列表 -->
        <div class="section-count">
          <div class="money-box">
            <ul>
              <li>
                <span class="title">商品件数：</span>
                <span class="value">{{selectedItems.length}}件</span>
              </li>
              <li>
                <span class="title">运费：</span>
                <span class="value">0元</span>
              </li>
              <li class="total">
                <span class="title">应付总额：</span>
                <span class="value">
                  <span class="total-price">{{totalPrice }}</span>元
                </span>
              </li>
              <!-- 显示选中地址信息 -->
              <li v-if="confirmAddress" style="white-space: nowrap;">
                <span class="title">寄送至：</span>
                  <span class="value">{{ getAddressInfo(confirmAddress) }}</span>
              </li>
              <!-- 显示收件人信息 -->
              <li v-if="confirmAddress" style="white-space: nowrap;">
                <span class="title">收件人：</span>
                  <span class="value">{{ getRecipientInfo(confirmAddress) }}</span>
              </li>
            </ul>
          </div>
        </div>
        <!-- 结算列表END -->

        <!-- 结算导航 -->
        <div class="section-bar">
          <div class="btn">
            <router-link to="/cart" class="btn-base btn-return">返回购物车</router-link>
            <a href="javascript:void(0);" @click="addOrder" class="btn-base btn-primary">结算</a>
          </div>
        </div>
        <!-- 结算导航END -->
      </div>
      <!-- 主要内容容器END -->
    </div>
  </div>
</template>
<script>
import Header from "@/components/Header.vue";
import {ElInputNumber} from "element-plus";
import axios from "axios";
export default {
  name: "",
  data() {
    return {
      selectedItems: [], // 选中的商品数据
      selectedItemsCount: 0, // 商品件数
      totalPrice: 0, // 商品总价
      confirmAddress: "", // 选择的地址id
      addresses: [],// 地址列表
      getCheckGoods:[],
      order_id:""//订单编号
    };
  },
  components:{
    Header,
  },
  created() {
    this.selectedItems = JSON.parse(this.$route.query.items);
    console.log(this.selectedItems)
    this.calculateTotalPrice();
    this.fetchAddress()
  },
  methods: {
    calculateTotalPrice() {
      this.totalPrice = this.selectedItems.reduce(
          (total, item) => total + item.price * item.quantity,
          0
      );
    },
    fetchAddress(){
      const user_id = JSON.parse(sessionStorage.getItem('user')).id
      axios
          .get("http://localhost:9991/address/address/getAddressList/"+user_id)
          .then(res=>{
            this.addresses = res.data.data
            this.confirmAddress = this.addresses[0].id;
            // console.log(res.data.data)
          })
          .catch(err=>{
            console.log(err)
          })
    },
    getImageUrl(imagePath) {
      return '/public/image/' + imagePath;
    },
    getAddressInfo(addressId) {
      const address = this.addresses.find(item => item.id === addressId);
      if (address) {
        const fullAddress = `${address.addr} `;
        return `${fullAddress}`;
      }
      return "";
    },
    getRecipientInfo(addressId) {
      const address = this.addresses.find(item => item.id === addressId);
      if (address) {
        const recipient = `${address.name} ${address.phone}`;
        return `${recipient}`;
      }
      return "";
    },
    addOrder() {
      const user_id = JSON.parse(sessionStorage.getItem('user')).id; // 获取用户ID
      const order = {
        id: null, // 自动生成的订单ID
        order_no: null, // 自动生成的订单号
        user_id: user_id, // 设置用户ID
        address_id: this.confirmAddress,
        amount: this.totalPrice,
        created_time: null, // 自动生成的订单创建时间
        payment_time: null, // 自动生成的订单支付时间
        comment: null, // 可以根据需要设置订单的备注信息
        status:1
      };

      // 将order对象保存到订单表
      axios
          .post("http://localhost:9991/order/order/addOrder", order)
          .then(res => {
            this.order_id = res.data.data.id
            axios
                .post("http://localhost:9991/order/orderItems/addOrderItems",{
                  order_id:this.order_id,
                  user_id:JSON.parse(sessionStorage.getItem('user')).id,
                  selectedItems:this.selectedItems
                })
                .then(res => {
                  this.$router.push({
                    path: '/order',
                    query: { order_id: this.order_id } // 参数对象
                  });
                })
                .catch(err => {
                  // 处理保存订单失败的情况
                  console.log("订单保存失败", err);
                });
          })
          .catch(err => {
            // 处理保存订单失败的情况
            console.log("订单保存失败", err);
          });
    },
  },
};
</script>
<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
.header[data-v-170e020b] {
  width: 100%;
  height: 40px;
  line-height: 40px;
  /* background-color: #f5f5f5; */
  font-size: 12px;
  display: block;
}
.confirmOrder {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}
/* 头部CSS */
.confirmOrder .confirmOrder-header {
  background-color: #fff;
  border-bottom: 2px solid #ff6700;
  margin-bottom: 20px;
}
.confirmOrder .confirmOrder-header .header-content {
  width: 1225px;
  margin: 0 auto;
  height: 64px;
}
.confirmOrder .confirmOrder-header .header-content p {
  float: left;
  font-size: 28px;
  line-height: 50px;
  color: #424242;
  margin-right: 20px;
}
.confirmOrder .confirmOrder-header .header-content p i {
  font-size: 45px;
  color: #ff6700;
  line-height: 80px;
}
/* 头部CSS END */

/* 主要内容容器CSS */
.confirmOrder .content {
  width: 1225px;
  margin: 0 auto;
  padding: 48px 0 0;
  background-color: #fff;
}

/* 选择地址CSS */
.confirmOrder .content .section-address {
  margin: 0 48px;
  overflow: hidden;
}
.confirmOrder .content .section-address .title {
  color: #333;
  font-size: 18px;
  line-height: 20px;
  margin-bottom: 20px;
}
.confirmOrder .content .address-body li {
  float: left;
  color: #333;
  width: 220px;
  height: 178px;
  border: 1px solid #e0e0e0;
  padding: 15px 24px 0;
  margin-right: 17px;
  margin-bottom: 24px;
}
.confirmOrder .content .address-body .in-section {
  border: 1px solid #ff6700;
}
.confirmOrder .content .address-body li h2 {
  font-size: 18px;
  font-weight: normal;
  line-height: 30px;
  margin-bottom: 10px;
}
.confirmOrder .content .address-body li p {
  font-size: 14px;
  color: #757575;
}
.confirmOrder .content .address-body li .address {
  padding: 10px 0;
  max-width: 180px;
  max-height: 88px;
  line-height: 22px;
  overflow: hidden;
}
.confirmOrder .content .address-body .add-address {
  text-align: center;
  line-height: 30px;
}
.confirmOrder .content .address-body .add-address i {
  font-size: 30px;
  padding-top: 50px;
  text-align: center;
}
/* 选择地址CSS END */

/* 配送方式CSS */
.confirmOrder .content .section-shipment {
  margin: 0 48px;
  padding: 25px 0;
  border-bottom: 1px solid #e0e0e0;
  overflow: hidden;
}
.confirmOrder .content .section-shipment .title {
  float: left;
  width: 150px;
  color: #333;
  font-size: 18px;
  line-height: 38px;
}
.confirmOrder .content .section-shipment .shipment {
  float: left;
  line-height: 38px;
  font-size: 14px;
  color: #ff6700;
}
/* 配送方式CSS END */

/* 结算列表CSS */
.confirmOrder .content .section-count {
  margin: 0 48px;
  padding: 20px 0;
  overflow: hidden;
}
.confirmOrder .content .section-count .money-box {
  float: right;
  text-align: right;
}
.confirmOrder .content .section-count .money-box .total-price {
  font-size: 30px;
}
.section-count .money-box ul li {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.section-count .money-box ul li .title {
  margin-right: 10px;
  text-align: right;
  white-space: nowrap;
  color: #757575;
}

.section-count .money-box ul li .value {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  color: #ff6700;
}



/* 结算列表CSS END */

/* 结算导航CSS */
.confirmOrder .content .section-bar {
  padding: 20px 48px;
  border-top: 2px solid #f5f5f5;
  overflow: hidden;
}
.confirmOrder .content .section-bar .btn {
  float: right;
}
.confirmOrder .content .section-bar .btn .btn-base {
  float: left;
  margin-left: 30px;
  width: 158px;
  height: 38px;
  border: 1px solid #b0b0b0;
  font-size: 14px;
  line-height: 38px;
  text-align: center;
}
.confirmOrder .content .section-bar .btn .btn-return {
  color: rgba(0, 0, 0, 0.27);
  border-color: rgba(0, 0, 0, 0.27);
}
.confirmOrder .content .section-bar .btn .btn-primary {
  background: #ff6700;
  border-color: #ff6700;
  color: #fff;
}
/* 结算导航CSS */

/* 购物车表头及CSS */
.confirmOrder .content .cartList .title {
  color: #333;
  font-size: 18px;
  line-height: 20px;
  margin-bottom: 20px;
}
.confirmOrder .content .cartList .header {
  height: 85px;
  padding-right: 26px;
  color: #424242;
  padding-left: 40px;
}
.confirmOrder .content .cartList .product-list {
  height: 85px;
  padding: 0 40px;
  border-top: 1px solid #e0e0e0;
}
.confirmOrder .content .cartList .pro-img {
  float: left;
  height: 85px;
  width: 120px;
}
.confirmOrder .content .cartList .pro-img img {
  height: 80px;
  width: 80px;
}
.confirmOrder .content .cartList .pro-name {
  float: left;
  width: 380px;
}
.confirmOrder .content .cartList .pro-name-text {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.confirmOrder .content .cartList .pro-price {
  float: left;
  width: 140px;
  padding-right: 18px;
  text-align: center;
}
.confirmOrder .content .cartList .pro-num {
  float: left;
  width: 150px;
  text-align: center;
}
.confirmOrder .content .cartList .pro-total {
  float: left;
  width: 120px;
  padding-right: 81px;
  text-align: right;
}
/* 购物车表头及CSS END */

/* 主要内容容器CSS END */
</style>