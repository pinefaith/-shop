import {createRouter,createWebHistory} from "vue-router"
import home from "@/components/Home.vue";
import ProductDetail from "@/components/ProductDetail.vue";
import Login from "@/components/Login.vue"
import Register from "@/components/Register.vue"
import searchResult from "@/components/SearchResult.vue";
import Profile from "@/components/Profile.vue";
import Address from "@/components/Address.vue";
import Information from "@/components/Information.vue";
import Love from "@/components/Love.vue";
import Cart from "@/components/Cart.vue";
import ConfirmOrder from "@/components/ConfirmOrder.vue";
import Order from "@/components/Order.vue";
import OrderList from "@/components/OrderList.vue";
import PayBack from "@/components/PayBack.vue";
import Prefer from "@/components/Prefer.vue";


const routes = [
    {
        path:'/',
        name:'Home',
        component:home
    },
    {
        path: '/product/:id',
        name: 'product-details',
        component: ProductDetail,
        props: true
    },
    {

        path: '/login',
        name: Login,
        component: Login,
        children: [
            {path: '/Register', component: Register},
        ],
        beforeEnter: (to, from, next) => {
            next()
        }
    },
    {
        path: '/search/searchResult/:searchClass/:searchText',
        name:'searchResult',
        component: searchResult
    },
    {
        path:'/Profile',
        name:'Profile',
        component: Profile,
        redirect:'/Information',
        children: [
            {path:'/Information', name:'Information', component: Information},
            {path:'/Address', name:'Address', component: Address},
            {path:'/orderList', name:'orderList', component:OrderList},
            {path:'/prefer', name:'prefer', component:Prefer},
            {path:'/cart', name:'Cart', component:Cart},
        ]
    },
    {
        path: '/confirmOrder',
        name:'ConfirmOrder',
        component: ConfirmOrder
    },
    {
        path: '/order',
        name:'order',
        component: Order
    },
    {
        path: '/payBack',
        name:'payBack',
        component: PayBack
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes, // `routes: routes` 的缩写
})

export default router