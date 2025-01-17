<script setup lang="ts">
</script>
<template>
    <main class="">
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
