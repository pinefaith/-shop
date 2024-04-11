<template>
  <div class="popularList clear">
    <h2 class="title">热销商品</h2>
    <ul>
      <li class="items" v-for="product in productList" @click="goToProductDetails(product.id)">
        <a href="#">
          <img :src=getImageUrl(product.image_url) alt="">
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import ProductDetail from "@/components/ProductDetail.vue";
import axios from "axios";

export default {
  name: "PopluarGoods",
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
        .get("http://localhost:9991/product/popularGoods/goods")
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
@import "../Mechanical-Industrial-Products-Mall-css/popluarList.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>