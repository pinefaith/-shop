<template>
  <div>
    <Header></Header>
    <hr>
    <div class="content">
      <div class="payment-container">
        <h1 class="title">订单支付</h1>
        <div style="display: flex">
          <div class="header" style="height: 130px;">
            <div class="method-icon" style="margin-right: 10px;"><img :src="success" alt=""></div>
            <div class="tip">
              <p style="text-align:left;">订单提交成功！请尽快完成支付。</p>
              <p style="text-align:left;">支付还剩 <span>{{  }}</span>, 超时后将取消订单</p>
            </div>
          </div>
          <div class="order-summary">
            <h2 class="section-title">订单详情</h2>
            <div class="order-items">
              <div class="item" v-for="item in orders" :key="item.id">
                <div class="item-info">
                  <div class="item-name">{{ item.product_name }}</div>
                  <div class="item-price">￥{{ item.price }}</div>
                </div>
                <div class="item-quantity">x{{ item.quantity }}</div>
              </div>
            </div>
            <div class="total-amount">
              <span class="label">总金额：</span>
              <span class="amount">￥{{ totalPrice }}</span>
            </div>
          </div>
        </div>
        <div class="payment-methods">
          <h2 class="section-title">选择支付方式</h2>
          <ul class="method-list">
            <li class="method-item" v-for="method in paymentMethods" :key="method.id">
              <label :for="method.id" class="method-label">
                <input type="radio" :id="method.id" :value="method.id" v-model="selectedPaymentMethod">
                <div class="method-info">
                  <div class="method-icon"><img :src="method.icon" alt=""></div>
                  <div class="method-name">{{ method.name }}</div>
                </div>
              </label>
            </li>
          </ul>
          <button class="pay-button" @click="pay">立即支付</button>
        </div>
      </div>
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
      productName: "", // 商品名称
      productNumber: "", // 商品编号
      success:'/public/image/success.png',
      paymentMethods: [
        { id: 'alipay', name: '支付宝', icon: '/public/image/alipay.png' },
        { id: 'wechatpay', name: '微信支付', icon: '/public/image/wechatpay.png' },
        { id: 'banktransfer', name: '银行转账', icon: '/public/image/banktransfer.png' }
      ],
      selectedPaymentMethod: '',
      // 支付地址
      baseURL:'http://pcapi-xiaotuxian-front-devtest.itheima.net/',
      backURL: 'http://127.0.0.1:5173/paycallback',
      redirectUrl: '', // 初始化为空字符串
      payUrl: '',
      showPaymentModal: false, // 控制支付模态框的显示
    };
  },
  components:{
    Header,
  },
  created() {
    this.redirectUrl = encodeURIComponent(this.backURL);
    this.payUrl = `${this.baseURL}pay/aliPay?orderId=${this.$route.query.order_id}&redirect=${this.redirectUrl}`;
    // 获取订单数据
    axios
      .get("http://localhost:9991/order/orderItems/getOrderItems/"+this.$route.query.order_id)
      .then(res => {
        console.log(res.data.data)
        this.orders = res.data.data
        this.calculateTotalPrice(); // 计算总价
        this.productNumber = res.data.data[0].order_no
        console.log(this.orders.length)
        console.log(this.orders)
      })
      .catch(err => {
        return Promise.reject(err);
      });
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
    getFormattedProductNames() {
      return this.orders.map(item => item.product_name).join(", ");
    },
    pay(){
      const productName = this.getFormattedProductNames();
      const productNumber = this.productNumber;
      const totalAmount = this.totalPrice;
      const account = JSON.parse(sessionStorage.getItem('user')).account
      const password = JSON.parse(sessionStorage.getItem('user')).password
      const payUrl = `http://localhost:9991/order/alipay/pay?account=${account}&password=${password}
      &subject=${productName}&traceNo=${productNumber}&totalAmount=${totalAmount}`;

      // 打开新窗口进行支付
      window.open(payUrl)
    },
  }
};
</script>
<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
li {
  list-style-type: none;
}

.tip {
  padding-left: 10px;
  flex: 1;
}
.text-overflow {
  white-space: nowrap; /* 防止换行 */
  overflow: hidden; /* 隐藏溢出部分 */
  text-overflow: ellipsis; /* 以省略号表示溢出部分 */
  /* 设置最大宽度或固定宽度，根据实际情况调整 */
  max-width: 150px;
}
.payment-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f5f5f5;
}

.header {
  margin-bottom: 20px;
  display: flex;
  align-items: center;
  flex-basis: 0;
  flex-grow: 1;
}

.title {
  font-size: 24px;
}


.payment-methods {
  flex: 1;
  margin-right: 20px;
}

.section-title {
  font-size: 18px;
  margin-bottom: 10px;
}

.method-list {
  list-style: none;
  padding: 0;
}

.method-item {
  margin-bottom: 10px;
}

.method-label {
  display: flex;
  align-items: center;
}

.method-info {
  display: flex;
  align-items: center;
  background-color: #fff;
  padding: 10px;
  border-radius: 4px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  cursor: pointer;
}

.method-icon {
  width: 40px;
  height: 40px;
  margin-right: 10px;
}

.method-icon img {
  width: 100%;
  height: 100%;
}

.method-name {
  font-size: 16px;
}

.order-summary {
  flex-basis: 0;
  flex-grow: 1;
}

.order-items {
  margin-bottom: 10px;
}

.item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.item-info {
  flex: 1;
  display: flex;
  align-items: center;
}

.item-name {
  font-size: 16px;
}

.item-price {
  margin-left: 10px;
}

.item-quantity {
  font-size: 14px;
}

.total-amount {
  font-size: 18px;
  text-align: right;
  margin-bottom: 10px;
}

.pay-button {
  display: block;
  width: 100%;
  max-width: 200px;
  margin: 0 auto;
  padding: 10px;
  font-size: 18px;
  text-align: center;
  background-color: #ff5252;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
.payment-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  width: 1000px;
  height: 600px;
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

iframe {
  width: 100%;
  height: 100%;
  border: none;
}
</style>