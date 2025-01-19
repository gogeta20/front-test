import { createRouter, createWebHistory } from 'vue-router';
// import homeRoutes from '@/modules/home/application/routes';
import HomeView from "@/PageView/HomeView.vue";
import Projects from '@/PageView/Projects.vue';
import Whoami from '../../PageView/Whoami.vue';
import Skills from '../../PageView/Skills.vue';

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
      {
        path: "/projects",
        component: Projects,
        children: [],
      },
      {
        path: "/whoami",
        component: Whoami,
        children: [],
      },
      {
        path: "/skills",
        component: Skills,
        children: [],
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

export default router;
