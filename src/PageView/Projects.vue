<script setup lang="ts">
</script>
<template>
    <main class="">
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
