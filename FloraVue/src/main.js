import { createApp } from 'vue'
import App from './App.vue' 
import router from './router' 
import 'bootstrap/dist/css/bootstrap.min.css' 
import 'bootstrap/dist/js/bootstrap.bundle.min.js'

const app = createApp(App)

app.use(router) // Dile a Vue que use el router
app.mount('#app') // Monta todo en el div con id="app" de tu index.html