<script setup lang="ts">
const desktopSkills = [
  { label: "PHP", height: "200px", color: "bg-white" },
  { label: "JS", height: "200px", color: "bg-white" },
  { label: "PYTHON", height: "170px", color: "bg-white" },
  { label: "JAVA", height: "180px", color: "bg-white" },
  { label: "RUST", height: "100px", color: "bg-white" },
  { label: "SQL", height: "200px", color: "bg-white" },
  { label: "Symfony", height: "200px", color: "cheapest" },
  { label: "Vue", height: "180px", color: "cheapest" },
  { label: "Django", height: "120px", color: "cheapest" },
  { label: "SpringBoot", height: "130px", color: "cheapest" },
  { label: "Docker", height: "180px", color: "cheapest" },
  { label: "Git", height: "190px", color: "cheapest" },
];

const mobileSkills = desktopSkills.map((skill) => ({
  label: skill.label,
  width: skill.height,
  color: skill.color,
}));
</script>
<script setup lang="ts"></script>
<template>
  <div class="content bg-green">
    <div class="fare-calendar">
      <p class="kode-style text-4xl md:text-6xl text-center text-white mb-4">Skills</p>
      <div class="fare-rates">
        <!-- Escritorio -->
        <div class="fare-monthcontainer hidden sm:flex">
          <ul>
            <li v-for="(skill, index) in desktopSkills" :key="index" class="fare-month">
              <span class="fare-price" :class="skill.color" :style="{ height: skill.height }"></span>
              <span class="ttl1">{{ skill.label }}</span>
            </li>
          </ul>
        </div>

        <!-- Móvil -->
        <div class="skills-movil sm:hidden">
          <ul>
            <li v-for="(skill, index) in mobileSkills" :key="index" class="fare-month-movil">
              <span class="ttl1">{{ skill.label }}</span>
              <span class="fare-price" :class="skill.color" :style="{ width: skill.width }"></span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>


<style scoped>
.skills-movil{
  display: flex;
  flex-direction: column;
  gap: .5rem
}
.fare-month-movil{
  display: grid;
  grid-template-columns: 1fr 2fr;
	margin: 0 4px;
}

.fare-month-movil span {
  margin: 5px;
}

 .fare-month-movil span.fare-price {
	min-height: 20px;
	background-color: #FFF ;
	transform-origin: 100% 100%;
	border-radius: 3px;
}

 .fare-month-movil span.fare-price.cheapest {
	background-color: #EF3D84 ;
}

 .fare-month-movil span.fare-price:hover {
	background-color: #ccc ;
	cursor: pointer;
}

 .fare-month-movil span.fare-price.cheapest:hover {
	background-color: #C13773 ;
	cursor: pointer;
}

.content{
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.ttl1,.ttl2{
	color: #fff !important;
}

.fare-rates {
	position: relative;
  min-height: 70vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.fare-monthcontainer {
  display: flex;
  align-items: center;
}


 .fare-month {
	margin: 0 4px;
	display: inline-block;
	width: 88px;
	text-align: center;
}

 .fare-month a
,  .fare-month span {
	display: block;
}

 .fare-month span:first-of-type {
	margin-bottom: 7px;
}

 .fare-month span:last-of-type {
	margin: 10px 0 7px;
}

 .fare-month button.btn2 {
	width: 60px;
	padding-left: 0;
	padding-right: 0;
}

 .fare-month span.fare-price {
	min-height: 20px;
	background-color: #FFF ;
	transform-origin: 100% 100%;
	border-radius: 3px;
}

 .fare-month span.fare-price.cheapest {
	background-color: #EF3D84 ;
}

 .fare-month span.fare-price:hover {
	background-color: #ccc ;
	cursor: pointer;
}

 .fare-month span.fare-price.cheapest:hover {
	background-color: #C13773 ;
	cursor: pointer;
}

@media (max-width: 640px) {
  .fare-month{
    display: none;
  }
  .fare-rates {
    flex-direction: row;
  }
  .fare-month {
	  width: 28px;
  }
}

@media (min-width: 640px) {
  .skills-movil {
    display: none;
  }
}
</style>
