<template>
  <div class="phone clear">
    <h2 class="title">
      工具耗材
    </h2>
    <div class="phone-box">
      <div class="phone-box-left">
        <div class="recommend-title">
          工具/耗材
        </div>
        <div class="list-group">
          <a>电动工具</a>
          <a>气动工具</a>
          <a>扳手/手动套筒</a>
          <a>扭力工具</a>
          <a>充电式工具</a>
          <a>锤/搓/锯/刀/尺</a>
        </div>
        <a href="">
          <img src="../Mechanical-Industrial-Products-Mall-images/1491012392394749.jpg" alt="">
        </a>
      </div>
      <div class="phone-box-right">
        <ul>
          <li v-for="product in productList.slice(0,8)" class="items" @click="goToProductDetails(product.id)">
            <a href="#">
              <img :src=getImageUrl(product.image_url) alt="">
              <p class="good-name">{{ product.product_name }}</p>
              <p class="good-info">{{ product.message }}</p>
              <p class="good-price">{{ product.price }}元</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import ProductDetail from "@/components/ProductDetail.vue";

export default {
  name: "GoodsList",
  data(){
    return{
      productList:[],
    }
  },
  methods:{
    getImageUrl(imagePath) {
      return '/public/image/' + imagePath;
    },
    goToProductDetails(productId) {
      let that = this
      that.$router.push({ name: 'product-details', params: { id: productId } });
    }
  },
  components:{
    ProductDetail
  },
  mounted() {
    axios
        .get("http://localhost:9991/product/shopMall/productType/list/10094")
        .then(response => {
          this.productList = response.data;
        })
        .catch(error => {
          console.log(error);
        });
  },
}
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>