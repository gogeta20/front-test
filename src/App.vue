<script setup lang="ts">
import particlesVue from "./components/particles.vue";
import footerVue from "./components/footer.vue";
</script>
<template>
  <main class="">
    <div class="flex h-screen sticky top-0">
      <div class="container m-auto p-5">
        <particlesVue />
        <p class="font-sans font-light h-20 text-white text-sm tracking-long">
          SZYMONB_ DEV
        </p>
        <p class="font-sans text-6xl h-28 text-white font-semibold">szymonb_</p>
        <div class="w-0 grid gap-16 grid-cols-4 text-white text-3xl">
          <a
            class="transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110"
            href="https://www.linkedin.com/in/szymonbdev/"
            target="_blank"
            ><span
              class="iconify"
              data-icon="teenyicons:linkedin-outline"
            ></span>
          </a>
          <a
            class="transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110"
            href="https://github.com/szymboro"
            target="_blank"
            ><span
              class="iconify"
              data-icon="akar-icons:github-outline-fill"
            ></span>
          </a>
          <a
            class="transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110"
            href="mailto:contact@szymonb.dev"
            target="_blank"
            ><span class="iconify" data-icon="ci:mail"></span>
          </a>
          <a
            class="transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110"
            href="https://calendly.com/szymonb/30min"
            target="_blank"
            ><span
              class="iconify"
              data-icon="ant-design:calendar-outlined"
            ></span>
          </a>
        </div>
      </div>
    </div>

    <div class="flex h-screen bg-black sticky top-0">
      <div class="container m-auto p-5">
        <div class="content">
          <div class="py-3">
            <p class="font-mono text-6xl text-white">WH0AMI?</p>
            <p class="font-mono text-gray-300 text-xs sm:text-base pt-8 w-5/6">
              Hi there, I'm Simon and I'm a web developer with a passion for
              creating websites using WordPress and Vue.js. Over the years, I've
              had the opportunity to work with clients from all around the world
              and from various industries. I take pride in my ability to build
              websites that are both visually appealing and highly functional,
              making sure that the end-users have a great experience. <br />
              <br />
              Whether you need a website for personal or business use, I can
              help you bring your vision to life. With my expertise in WordPress
              and Vue.js, I can deliver exceptional results that cater to your
              specific needs. So, if you're looking to take your online presence
              to the next level, get in touch with me today and let's get
              started!
            </p>
          </div>
          <div class="roadmap pt-10">
            <p class="font-mono text-3xl text-white">R0ADMAP</p>
            <div class="flex items-center place-content-evenly">
              <span
                class="iconify"
                data-icon="carbon:html"
                style="color: #fff"
                data-width="65"
              ></span>
              <span class="line finished"></span>
              <span
                class="iconify"
                data-icon="ic:baseline-css"
                style="color: #fff"
                data-width="65"
              ></span>
              <span class="line finished"></span>
              <span
                class="iconify"
                data-icon="ic:baseline-javascript"
                style="color: #fff"
                data-width="65"
              ></span>
              <span class="line finished"></span>
              <span
                class="iconify animate-pulse"
                data-icon="fa6-brands:vuejs"
                style="color: #d100d1"
                data-width="45"
              ></span>
              <span class="line"></span>
              <span
                class="iconify"
                data-icon="fontisto:react"
                style="color: white"
                data-width="45"
              ></span>
              <span class="line"></span>
              <span
                class="iconify"
                data-icon="bx:question-mark"
                style="color: white"
                data-width="45"
              ></span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="flex h-screen bg-white sticky top-0">
      <div class="container m-auto p-5">
        <p class="font-mono text-6xl text-black">WEB PR0JECTS</p>
        <br />
        <div
          class="carousel"
          data-flickity='{ "imagesLoaded": true, "wrapAround": false,  "groupCells": 1 }'
        >
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/kancelaria.png" />
            <a
              href="https://notariusz.magda-zielecka.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
            >
              <p>Notariusz Aneta Magda-Zielecka</p>
            </a>
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/odaart.png" />
            <a
              href="https://odaart.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
              ><p>OdaArt</p></a
            >
          </div>

          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/eurowasta.png" />
            <a
              href="https://eurowasta.com/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
              ><p>Euro-Wasta</p></a
            >
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/biennale.png" />
            <a
              href="https://biennalepiotrkow.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
              ><p>Biennale</p></a
            >
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/makeupmalachowska.png" />
            <a
              href="https://makeupmalachowska.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
            >
              <p>Makeup Małachowska</p>
            </a>
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/wmmobile.png" />
            <a
              href="https://wm-mobile.de/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
            >
              <p>Malc Automobile</p>
            </a>
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img href="" src="../src/assets/projects/praca1.png" />
            <a
              href="https://przestrzen-zamknieta.odaart.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
            >
              <p>Przestrzeń Zamknięta/Otwarta</p>
            </a>
          </div>
          <div class="border-4 rounded-md border-black bg-black">
            <img src="../src/assets/projects/praca2.png" />
            <a
              href="https://anabioza.odaart.pl/"
              target="_blank"
              class="font-mono text-sm md:text-2xl text-white text-center"
              ><p>Anabioza</p>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div class="flex h-screen bg-black sticky top-0">
      <div class="container m-auto p-5">
        <p class="font-mono text-6xl text-white">HT0P</p>
        <div class="pt-6">
          <figure>
            <embed
              class="h-full"
              src="https://wakatime.com/share/@szymboro/5227ed85-4f17-4153-8ac9-ffa3b5f1c724.svg"
            />
          </figure>
        </div>
      </div>
    </div>

    <footerVue />
  </main>
</template>



<style scoped>
.line {
  height: 2px;
  width: 40px;
  background-color: #fff;
  float: left;
  margin: 14px 0px;
  padding: 0px;
}
.line.finished {
  height: 2px;
  width: 40px;
  background-color: #d100d1;
  float: left;
  margin: 14px 0px;
  padding: 0px;
}

.carousel div {
  width: 66%;
  margin: 40px;
}

embed {
  max-height: 500px;
}
</style>
