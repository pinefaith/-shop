import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import 'element-plus/theme-chalk/index.css'
import router from "@/router/index";
import ElementPlus from 'element-plus'
// import 'element-plus/lib/theme-chalk/index.css'
import 'element-plus/dist/index.css'
const app = createApp(App)
const eventBus = createApp({});
app.config.globalProperties.eventBus = eventBus;
app.use(router)
app.use(ElementPlus)
app.mount('#app')