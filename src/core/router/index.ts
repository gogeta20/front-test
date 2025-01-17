import { createRouter, createWebHistory } from 'vue-router';
// import homeRoutes from '@/modules/home/application/routes';
import HomeView from "@/PageView/HomeView.vue";

const routes = [
  {
    path: '/',
    redirect: "/home",
    component: () => import("@/core/layout/BaseLayout.vue"),
    children: [
      {
        path: "/home",
        component: HomeView,
        children: [],
      },
    ],
  }
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

export default router;
