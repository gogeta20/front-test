<script setup lang="ts">
import { ref } from "vue";
import ParticlesView from "@/components/ParticlesView.vue";
import Header from "@/core/layout/components/Header.vue";
import SideBar from "@/core/layout/components/SideBar.vue";

const isOpenMenu = ref(false);

const openSidBar = async () => {
  isOpenMenu.value = !isOpenMenu.value;
};

const closeSideBar = () => {
  isOpenMenu.value = false;
};
</script>

<template>
  <div>
    <ParticlesView />
    <Header @menu-toggle="openSidBar" />
    <SideBar :isOpenSideBar="isOpenMenu" />
    <main @click="closeSideBar">
      <section>
        <RouterView />
      </section>
    </main>
  </div>
</template>

<style lang="scss" scoped></style>
