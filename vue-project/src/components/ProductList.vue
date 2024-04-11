<template>
  <div class="elc-right">
    <ul>
      <li v-for="(product) in productList.slice(0,7)" class="items" @click="goToProductDetails(product.id)">
        <a href="#">
          <img :src=getImageUrl(product.image_url) alt="">
          <p class="good-name">{{ product.product_name }}</p>
          <p class="good-info">{{ product.message }}</p>
          <p class="good-price">{{ product.price }}元</p>
        </a>
      </li>
      <li v-for="(product) in productList.slice(7,8)" class="items1">
        <a href="">
          <div>
            <a href="">
              <p class="items1-info" @click="goToProductDetails(product.id)">
                <span>{{ product.product_name }}</span><br>
                <span class="items1-price">{{ productList[7].price }}元</span>
              </p>
              <img :src="getImageUrl(product.image_url)" alt="">
            </a>
          </div>
          <div>
            <router-link :to="`/search/searchResult/${0}/${params.sort_name}`">
              <a href="">
                <p class="items1-info2">
                  <span>浏览更多</span>
                </p>
                <i class="iconfont">&#xe62d;</i>
              </a>
            </router-link>
          </div>
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
import ProductDetail from "@/components/ProductDetail.vue";

export default {
  name: "ProductList",
  props:{
    params: {
      type: Object,
      required: true
    }
  },
  data(){
    return{
      productList:[],
    }
  },
  components:{
    ProductDetail
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
  mounted() {
    axios
        .get("http://localhost:9991/product/shopMall/productType/list/"+this.params.goodsClass)
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