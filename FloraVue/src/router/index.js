import { createRouter, createWebHistory } from 'vue-router';
import WelcomeView from '../views/WelcomeView.vue';
import CatalogoView from '../views/CatalogoView.vue';

const routes = [
  {
    path: '/',
    name: 'welcome',
    component: WelcomeView
  },
  {
    path: '/catalogo',
    name: 'catalogo',
    component: CatalogoView
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;