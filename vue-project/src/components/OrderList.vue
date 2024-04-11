<template>
  <div>
    <div class="order">
      <!-- 我的订单头部 -->
      <div class="order-header">
        <div class="order-header-content">
          <p>
            <i class="el-icon-s-order" style="font-size: 30px;color: #ff6700;"></i>
            我的订单
          </p>
        </div>
      </div>
      <!-- 我的订单头部END -->

      <!-- 我的订单主要内容 -->
      <div class="order-content" v-if="orders.length > 0">
        <div class="content" v-for="(order, index) in orders" :key="index">
          <ul>
            <!-- 我的订单表头 -->
            <li class="order-info">
              <div class="order-id">订单编号: {{ order.order_no }}</div>
              <div class="order-info-right">
                <div class="order-time">订单时间: {{ order.created_time }}</div>
                <div class="delete-pic">
                  <a href="#" @click="deleteOrder(order.order_no)"><img src="../../public/image/delete.png" class="delete-img"></a>
                </div>
              </div>
            </li>
            <li class="header">
              <div class="pro-img"></div>
              <div class="pro-name">商品名称</div>
              <div class="pro-price">单价</div>
              <div class="pro-num">数量</div>
              <div class="pro-total">小计</div>
            </li>
            <!-- 我的订单表头END -->

            <!-- 订单列表 -->
            <li class="product-list" v-for="(item, i) in order.items" :key="i">
              <div class="pro-img">
                <router-link :to="{ path: '/Product/' + item.product_id }">
                  <img :src="getImageUrl(item.image_url)" />
                </router-link>
              </div>
              <div class="pro-name text-overflow">
                <router-link :to="{ path: '/Product/' + item.product_id }">
                  {{ item.product_name }}
                </router-link>
              </div>
              <div class="pro-price">{{ item.price }}元</div>
              <div class="pro-num">{{ item.quantity }}</div>
              <div class="pro-total pro-total-in">{{ item.total }}元</div>
            </li>
            <!-- 订单列表END -->

            <div class="order-bar">
              <div class="order-bar-left">
                <span class="order-total">
                  共
                  <span class="order-total-num">{{ order.items.length }}</span>
                  件商品
                </span>
              </div>
              <div class="order-bar-right" style="margin-left:50px;margin-right: 50px">
                <span>
                  <span class="order-total">交易状态：</span>
                  <span class="total-price">
                      {{ order.status === 1 ? '未支付' : order.status === 2 ? '已支付' : order.status === 3 ? '已发货' : order.status === 4 ? '交易成功' : '' }}
                  </span>
                </span>
                <span v-if="order.status === 1">
                  <el-button type="success" plain @click="pay(order)">去支付</el-button>
                </span>
              </div>
              <div class="order-bar-right">
                <span>
                  <span class="total-price-title">合计：</span>
                  <span class="total-price">{{ order.totalPrice }}元</span>
                </span>
              </div>
            </div>
          </ul>
        </div>
        <div style="margin-top: -40px;"></div>
      </div>
      <!-- 我的订单主要内容END -->

      <!-- 订单为空的时候显示的内容 -->
      <div v-else class="order-empty">
        <div class="empty">
          <h2>您的订单还是空的！</h2>
          <p>快去购物吧！</p>
        </div>
      </div>
      <!-- 订单为空的时候显示的内容END -->
    </div>
  </div>
</template>
<script>
import Header from "@/components/Header.vue";
import axios from "axios";
export default {
  data() {
    return {
      orders: [], // 订单列表
      total: [], // 每个订单的商品数量及总价列表
      totalPrice: 0, // 总价
    };
  },
  components:{
    Header,
  },
  created() {
    this.fetchOrderList()
  },
  methods:{
    getImageUrl(imagePath) {
      return '/public/image/' + imagePath;
    },
    calculateTotalPrice() {
      this.totalPrice = this.orders.reduce((total, item) => {
        return total + item.price * item.quantity;
      }, 0);
    },
    getOrderStatus(order) {
      switch (order.status) {
        case 1:
          return '未支付';
        case 2:
          return '已支付';
        case 3:
          return '已发货';
        case 4:
          return '交易成功';
        default:
          return '';
      }
    },
    fetchOrderList(){
      const user_id = JSON.parse(sessionStorage.getItem('user')).id
      // 获取订单数据
      axios
          .get("http://localhost:9991/order/orderItems/getOrderList/"+user_id)
          .then(res => {
            const orders = {};
            console.log(res.data.data)
            res.data.data.forEach((orderItem) => {
              const orderNo = orderItem.order_no;
              if (!orders[orderNo]) {
                orders[orderNo] = {
                  order_no: orderNo,
                  created_time: orderItem.created_time,
                  payment_time: orderItem.payment_time,
                  status:orderItem.status,
                  items: [],
                  totalPrice: 0,
                };
              }
              orders[orderNo].items.push(orderItem);
              orders[orderNo].totalPrice += orderItem.total;
            });

            // 将分类后的订单数据设置到组件的数据属性中
            this.orders = Object.values(orders);
            this.orders.sort((a, b) => b.order_no - a.order_no);
            console.log(orders)
          })
          .catch(err => {
            return Promise.reject(err);
          });
    },
    pay(order){
      const productName = order.items.map(item => item.product_name).join(', ');
      const productNumber = order.order_no;
      const totalAmount = order.totalPrice;
      // 构造支付请求的URL
      const payUrl = `http://localhost:9991/order/alipay/pay?subject=${productName}&traceNo=${productNumber}&totalAmount=${totalAmount}`;

      // 打开新窗口进行支付
      window.open(payUrl)
    },
    deleteOrder(order_no1){
      const order_no = order_no1
      axios.delete(`http://localhost:9991/order/orderItems/deleteOrder/${order_no}`)
          .then(res => {
            console.log(res)
            console.log('订单删除成功', res.data);
            this.fetchOrderList()
          })
          .catch(error => {
            // 处理错误情况
            console.error('订单删除失败', error);
          });
    },
  }
};
</script>
<style scoped>
li{
  list-style-type: none;
}
a{
  text-decoration: none;
  color: #333;
}
.text-overflow {
  white-space: nowrap; /* 防止换行 */
  overflow: hidden; /* 隐藏溢出部分 */
  text-overflow: ellipsis; /* 以省略号表示溢出部分 */
  /* 设置最大宽度或固定宽度，根据实际情况调整 */
  max-width: 350px;
}
.order {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}
/* 我的订单头部CSS */
.order .order-header {
  height: 64px;
  border-bottom: 2px solid #ff6700;
  background-color: #fff;
  margin-bottom: 20px;
}
.order .order-header .order-header-content {
  width: 1225px;
  margin: 0 auto;
}
.order .order-header p {
  font-size: 28px;
  line-height: 0;
  float: left;
  font-weight: normal;
  color: #424242;
}
/* 我的订单头部CSS END */
.order .content {
  width: 1225px;
  margin: 0 auto;
  background-color: #fff;
  margin-bottom: 50px;
}

.order .content ul {
  background-color: #fff;
  color: #424242;
  line-height: 85px;
}
/* 我的订单表头CSS */
.order .content ul .order-info {
  height: 60px;
  line-height: 60px;
  padding: 0 26px;
  color: #424242;
  display: flex; /* Add flex display */
  justify-content: space-between; /* Add space between elements */
  align-items: center; /* Vertically center the elements */
  border-bottom: 1px solid #ff6700;
}
.order .content ul .order-info .order-id {
  color: #ff6700;
  flex: 1;
}
.order .content ul .order-info .order-info-right {
  display: flex;
  align-items: center;
}
.order .content ul .order-info .order-time {
  float: right;
  margin-right: 10px;
}
.order .content ul .order-info .delete-pic {
  position: relative; /* 使用相对定位 */
  margin-right: 10px; /* 调整删除图片与订单时间之间的间距 */
}
.order .content ul .order-info .delete-pic .delete-img {
  width: 20px;
  height: 20px;
}
.order .content ul .header {
  display: flex;
  align-items: center;
  height: 85px;
  padding-right: 26px;
  color: #424242;
}

/* 我的订单表头CSS END */

/* 订单列表CSS */
.order .content ul .product-list {
  height: 85px;
  padding: 15px 26px 15px 0;
  border-top: 1px solid #e0e0e0;
}
.order .content ul .pro-img {
  float: left;
  height: 85px;
  width: 120px;
  padding-left: 80px;
}
.order .content ul .pro-img img {
  height: 80px;
  width: 80px;
}
.order .content ul .pro-name {
  float: left;
  width: 380px;
}
.order .content ul .pro-name a {
  color: #424242;
}
.order .content ul .pro-name a:hover {
  color: #ff6700;
}
.order .content ul .pro-price {
  float: left;
  width: 160px;
  padding-right: 18px;
  text-align: center;
}
.order .content ul .pro-num {
  float: left;
  width: 190px;
  text-align: center;
}
.order .content ul .pro-total {
  float: left;
  width: 160px;
  padding-right: 81px;
  text-align: right;
}
.order .content ul .pro-total-in {
  color: #ff6700;
}

.order .order-bar {
  width: 1185px;
  padding: 0 20px;
  border-top: 1px solid #ff6700;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
}
.order .order-bar .order-bar-left {
  float: left;
}
.order .order-bar .order-bar-left .order-total {
  color: #757575;
}
.order .order-bar .order-bar-left .order-total-num {
  color: #ff6700;
}
.order .order-bar .order-bar-right {
  float: right;
}
.order .order-bar .order-bar-right span {
  display: inline-block;
  vertical-align: middle;
}
.order .order-bar .order-bar-right .total-price-title {
  color: #ff6700;
  font-size: 14px;
}
.order .order-bar .order-bar-right .total-price {
  color: #ff6700;
  font-size: 30px;
}
/* 订单列表CSS END */

/* 订单为空的时候显示的内容CSS */
.order .order-empty {
  width: 1225px;
  margin: 0 auto;
}
.order .order-empty .empty {
  height: 300px;
  padding: 0 0 130px 558px;
  margin: 65px 0 0;
  background: url(/public/image/cart-empty.png) no-repeat 124px 0;
  color: #b0b0b0;
  overflow: hidden;
}
.order .order-empty .empty h2 {
  margin: 70px 0 15px;
  font-size: 36px;
}
.order .order-empty .empty p {
  margin: 0 0 20px;
  font-size: 20px;
}
/* 订单为空的时候显示的内容CSS END */
</style>