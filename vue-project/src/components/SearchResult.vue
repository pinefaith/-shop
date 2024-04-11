<template>
<div>
  <Header></Header>
  <Search></Search>
  <hr>
  <div class="wrap">
    <div class="category">
      <div class="line">
        <ul>
          一级分类：
          <li v-for="category in categories" :key="category.id"
              @click="handleCategory1Click(category) ; handleCategory3Click(category)">
            {{ category.sort_name }}
          </li>
        </ul>
      </div>

      <div class="line">
        <ul v-if="selectedCategory1">
          二级分类：
          <li v-for="category in selectedCategory1.children" :key="category.id"
              @click="handleCategory2Click(category) ; handleCategory3Click(category)">
            {{ category.sort_name }}
          </li>
        </ul>
      </div>

      <div class="line">
        <ul v-if="selectedCategory2">
          三级分类：
          <li v-for="category in selectedCategory2.children" :key="category.id" @click="handleCategory3Click(category)">
            {{ category.sort_name }}
          </li>
        </ul>
      </div>
    </div>

    <div class="result-warpper">
      <div class="result">
        <ul>
          <li v-for="product in searchResults.slice((page-1)*limit,page*limit)" class="items" @click="goToProductDetails(product.id)">
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
    <div class="page-wrapper">
      <div class="page">
        <el-pagination
            v-model:current-page=page
            v-model:page-size=limit
            :page-sizes="[8, 12, 16, 20]"
            :background=background
            layout="total, sizes, prev, pager, next, jumper"
            :total=total
            @size-change=handleSizeChange
            @current-change=handleCurrentChange
        />
      </div>
    </div>
  </div>
</div>
</template>

<script>
import {defineComponent, onMounted, ref} from 'vue';
import {useRoute, useRouter} from 'vue-router'
import axios from "axios";
import Header from "@/components/Header.vue";
import Search from "@/components/Search.vue";
export default defineComponent({
  name: "SearchResult",
  components: {Search, Header},
  setup(){
    const router = useRoute()
    const { push } = useRouter()
    const product = ref('')
    const searchResults = ref([])
    const categories = ref([])
    const selectedCategory1 = ref(null)
    const selectedCategory2 = ref(null)
    const searchText = router.params.searchText
    const total = ref(0)
    const page = ref(1)
    const limit = ref(8)
    const background = ref(false)
    console.log(searchText)
    const getImageUrl = (imagePath) =>{
      return '/public/image/' + imagePath;
    }
    const goToProductDetails = (productId) => {
      push({ name: 'product-details', params: { id: productId } });
    }

    const fetchSearchResults = () => {
      if (parseInt(router.params.searchClass) === 1) {
        axios.all([
          axios.get(`http://localhost:9991/product/Product/search/${searchText}`),
          axios.get("http://localhost:9991/product/shopMall/productType/list")
        ])
            .then(axios.spread((response1, response2) => {
              searchResults.value = response1.data
              total.value = searchResults.value.length
              categories.value = response2.data

              if (categories.value.length > 0) {
                selectedCategory1.value = categories.value[0];
                if (selectedCategory1.value.children.length > 0) {
                  selectedCategory2.value = selectedCategory1.value.children[0];
                }
              }
            }))
            .catch(error => {
              console.log(error)
            })
      } else {
        axios.all([
          axios.get(`http://localhost:9991/product/shopMall/productType/search/${searchText}`),
          axios.get("http://localhost:9991/product/shopMall/productType/list")
        ])
            .then(axios.spread((response1, response2) => {
              searchResults.value = response1.data
              total.value = searchResults.value.length
              categories.value = response2.data

              if (categories.value.length > 0) {
                selectedCategory1.value = categories.value[0];
                if (selectedCategory1.value.children.length > 0) {
                  selectedCategory2.value = selectedCategory1.value.children[0];
                }
              }
            }))
            .catch(error => {
              console.log(error)
            })
      }
    }

    onMounted(()=>{
      fetchSearchResults()
    })

    const handleCategory1Click = (category) => {
      selectedCategory1.value = category;
      selectedCategory2.value = null;
    };

    const handleCategory2Click = (category) => {
      selectedCategory2.value = category;
    };

    const handleSizeChange = (val) => {
      limit.value = val
      page.value = 1
    }

    const handleCurrentChange = (val) => {
      page.value = val
    }

    const handleCategory3Click = (category) => {
      axios.get(`http://localhost:9991/product/shopMall/productType/search/${category.sort_name}`)
          .then(response => {
            searchResults.value = []
            searchResults.value = response.data
            total.value = searchResults.value.length
          })
          .catch(error => {
            console.error(error);
          });
    }

    return{
      getImageUrl,
      goToProductDetails,
      product,
      searchResults,
      categories,
      selectedCategory1,
      selectedCategory2,
      handleCategory1Click,
      handleCategory2Click,
      page, total,limit,
      background,
      handleCurrentChange,
      handleSizeChange,
      handleCategory3Click
    }
  },
})
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/SearchResult.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
</style>