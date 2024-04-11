<link rel="stylesheet" href="../Mechanical-Industrial-Products-Mall-css/mall.css">
<template>
  <div>
    <!--头部开始-->
    <Header></Header>
    <Search></Search>
    <!--头部结束-->
    <!-- banner开始 -->
    <div class="firstBanner">
      <div class="wrap">
        <div class="firstAlltype">
          所有商品分类
        </div>
        <div class="typeList">
          <ul>
            <li>首页</li>
            <li>产品选型</li>
            <li>会员卡</li>
            <li>领券中心</li>
            <li>快速下单</li>
            <li>积分商城</li>
            <li>官方维修</li>
            <li>清仓乐购</li>
            <li>买家必读</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="banner">
      <div class="wrap">
        <div class="banner-box">
          <div id="list" style="left: 0;">
            <img src="../Mechanical-Industrial-Products-Mall-images/1650436110651841.png" alt="">
            <img src="../Mechanical-Industrial-Products-Mall-images/1636539389226229.jpg" alt="">
            <img src="../Mechanical-Industrial-Products-Mall-images/1620263328732571.jpg" alt="">
            <img src="../Mechanical-Industrial-Products-Mall-images/1622448889900003.jpg" alt="">
          </div>
          <div id="buttons">
            <span index="1" class="on"></span>
            <span index="2"></span>
            <span index="3"></span>
            <span index="4"></span>
          </div>
          <a class="arrow" id="prev">&lt</a>
          <a class="arrow" id="next">&gt;</a>
          <div class="slide">
            <ul>
              <li v-for="type in productType" :key="type.id">
                <router-link :to="`/search/searchResult/${0}/${type.sort_name}`">
                  <a href="#"> {{type.sort_name}}</a>
                </router-link>
                <i class="iconfont">&#xe63c;</i>
                <div class="slide-list">
                  <ul v-for="subType in type.children">
                    <li>
                      <router-link :to="`/search/searchResult/${0}/${subType.sort_name}`">
                        <a href="">
                          <span>{{subType.sort_name}}-></span>
                        </a>
                      </router-link>
                    </li>
                    <li>
                      <a href="" v-if="subType.children != null">
                        <span v-for="subSubType in subType.children">
                          <router-link :to="`/search/searchResult/${0}/${subSubType.sort_name}`">
                            {{subSubType.sort_name}}
                          </router-link>
                        </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- banner结束 -->
    <!-- 主体开始 -->
    <div class="container">
      <div class="wrap">
        <!--商品热销开始-->
        <PopluarGoods></PopluarGoods>
        <!--商品热销结束-->
        <!-- 工具耗材开始 -->
        <GoodsList></GoodsList>
        <!-- 工具耗材结束 -->
        <!-- 劳保安全开始 -->
        <div class="elc">
          <h2 class="title">劳保安全</h2>
          <div class="elc-box">
            <div class="phone-box-left">
              <div class="recommend-title">
                劳保/安全
              </div>
              <div class="list-group">
                <a>安全标识</a>
                <a>呼吸防护</a>
                <a>化学品处理/泄露防护</a>
                <a>手部防护</a>
                <a>足部防护</a>
                <a>安全锁具</a>
              </div>
              <a href="">
                <img src="../Mechanical-Industrial-Products-Mall-images/1491012490969659.jpg" alt="">
              </a>
            </div>
            <ProductList :params="{goodsClass:'10097',sort_name:'劳保'}"></ProductList>
          </div>
        </div>
        <!-- 劳保安全结束 -->
        <!-- 清洁办公开始 -->
        <div class="elc">
          <h2 class="title">清洁办公</h2>
          <div class="elc-box">
            <div class="phone-box-left">
              <div class="recommend-title">
                清洁办公
              </div>
              <div class="list-group">
                <a>办公用品</a>
                <a>工业擦拭</a>
                <a>光源</a>
                <a>清洁设备</a>
                <a>办公设备</a>
                <a>通讯设备</a>
              </div>
              <a href="">
                <img src="../Mechanical-Industrial-Products-Mall-images/1491012696725685.jpg" alt="">
              </a>
            </div>
            <ProductList :params="{goodsClass:'10099',sort_name:'清洁'}"></ProductList>
          </div>
        </div>
        <!-- 清洁办公结束 -->
        <!-- 电器电工开始 -->
        <div class="elc">
          <h2 class="title">电器电工</h2>
          <div class="elc-box">
            <div class="recommend-title">
              电器电工
            </div>
            <div class="list-group">
              <a>室内灯具</a>
              <a>光源</a>
              <a>电工胶带</a>
              <a>接线板</a>
              <a>变频器</a>
              <a>低押断电器</a>
              <a>继电器</a>
              <a>接触器</a>
            </div>
            <div class="phone-box-left">
              <a href="">
                <img src="../Mechanical-Industrial-Products-Mall-images/1491012797411556.jpg" alt="">
              </a>
            </div>
            <ProductList :params="{goodsClass:'10100',sort_name:'电器'}"></ProductList>
          </div>
        </div>
        <!-- 电器电工结束 -->
        <!-- 流体机械开始 -->
        <div class="elc">
          <h2 class="title">流体机械</h2>
          <div class="phone-box-left">
            <div class="recommend-title">
              流体机械
            </div>
            <div class="list-group">
              <a>球轴承</a>
              <a>隔膜泵</a>
              <a>空气处理件</a>
              <a>工业润滑</a>
              <a>清洗防锈</a>
              <a>外六角螺栓</a>
              <a>查看全部</a>
            </div>
            <a href="">
              <img src="../Mechanical-Industrial-Products-Mall-images/1491443035347667.jpg" alt="">
            </a>
          </div>
          <ProductList :params="{goodsClass:'10102',sort_name:'气动'}"></ProductList>
        </div>
        <!-- 生活电器结束 -->
      </div>
    </div>
    <!-- 主体结束 -->
    <!-- 页脚开始 -->
    <Footer></Footer>
    <!-- 页脚结束 -->
  </div>
</template>

<script>
import GoodsList from "@/components/GoodsList.vue";
import ProductList from "@/components/ProductList.vue";
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Search from "@/components/Search.vue";
import PopluarGoods from "@/components/PopluarGoods.vue";
import axios from "axios";

export default {
  name: "Home",
  data(){
    return{
      data:"",
      productType:{},
      user: {},
      timer: null,
    }
  },
  methods:{
    created() {
      this.user = JSON.parse(sessionStorage.getItem('user'));
    },
    setupCarousel() {
      const list = document.getElementById("list");
      const prev = document.getElementById("prev");
      const next = document.getElementById("next");
      const buttons = document.getElementById("buttons").getElementsByTagName("span");
      let index = 1;

      function animate(offset) {
        const newLeft = parseInt(list.style.left) + offset;
        list.style.left = newLeft + "px";
        list.style.transition = "300ms ease";
        if (newLeft <= -3678) {
          list.style.left = 0 + "px";
        }
        if (newLeft > 0) {
          list.style.left = -2452 + "px";
        }
      }

      function showButton() {
        for (let i = 0; i < buttons.length; i++) {
          if (buttons[i].className === "on") {
            buttons[i].className = "";
          }
        }
        buttons[index - 1].className = "on";
      }

      prev.onclick = () => {
        index -= 1;
        if (index < 1) {
          index = 3;
        }
        showButton();
        animate(1226);
      };

      next.onclick = () => {
        index += 1;
        if (index > 3) {
          index = 1;
        }
        showButton();
        animate(-1226);
      };

      this.timer = setInterval(() => {
        next.click()
      }, 10000);

      for (let i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function () {
          const clickIndex = parseInt(this.getAttribute("index"));
          const offset = 1226 * (index - clickIndex);
          animate(offset);
          index = clickIndex;
          showButton();
        };
      }
    },
  },
  components: {
    PopluarGoods,
    GoodsList,
    ProductList,
    Footer,
    Header,
    Search
  },
  mounted() {
    this.setupCarousel()
    axios
        .get("http://localhost:9991/product/shopMall/productType/list")
        .then(response => {
          this.productType = response.data;
          console.log(data)
        })
        .catch(error => {
          console.log(error);
        });
  }
}
</script>

<style scoped>
@import "../Mechanical-Industrial-Products-Mall-css/mall.css";
@import "../Mechanical-Industrial-Products-Mall-css/mall-reset.css";
@import "../Mechanical-Industrial-Products-Mall-css/iconfont.css";
</style>