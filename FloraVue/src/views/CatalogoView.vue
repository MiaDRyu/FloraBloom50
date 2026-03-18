<template>
  <header id="main_header">
    <div class="container h-100 d-flex align-items-center justify-content-center">
      <img src="@/assets/img/logo.jpeg" alt="Logo" id="logo">
      <h1 class="m-0">FloraBloom</h1>
    </div>
  </header>

  <div class="container-fluid px-0" id="carousel_container">
    <div id="flowerCarousel" class="carousel slide h-100" data-bs-ride="carousel">
      <div class="carousel-inner h-100">
        <div class="carousel-item active h-100">
          <img src="@/assets/img/tulips.png" class="d-block w-100 h-100 object-fit-cover" alt="Tulips 1">
        </div>
        <div class="carousel-item h-100">
          <img src="@/assets/img/tulips2.webp" class="d-block w-100 h-100 object-fit-cover" alt="Tulips 2">
        </div>
      </div>
      </div>
  </div>

  <main class="container-fluid px-0 justify-content-center" id="main_content_home">
    <div class="row px-4 py-4">
      <div v-for="flor in listaFlores" :key="flor.id" class="col-md-3 mb-4">
        <div class="card h-100" @click="verDetalles(flor)">
          <img :src="flor.imagen_url" class="card-img-top" :alt="flor.nombre">
          <div class="card-body">
            <h5 class="card-title">{{ flor.nombre }}</h5>
            <p class="card-text text-muted">{{ flor.significado }}</p>
            <p class="fw-bold">${{ flor.precio }}</p>
          </div>
        </div>
      </div>
    </div>
  </main>

  <div v-if="florSeleccionada" class="modal fade show d-block" tabindex="-1" style="background: rgba(0,0,0,0.5)">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{ florSeleccionada.nombre }}</h5>
          <button type="button" class="btn-close" @click="florSeleccionada = null"></button>
        </div>
        <div class="modal-body text-center">
          <img :src="florSeleccionada.imagen_url" class="img-fluid mb-3 rounded" id="flowerModalImage">
          <p>{{ florSeleccionada.descripcion }}</p>
          <ul class="list-group text-start">
            <li class="list-group-item">☀️ <strong>Luz Solar:</strong> {{ florSeleccionada.luz_solar }}</li>
            <li class="list-group-item">💧 <strong>Riego:</strong> {{ florSeleccionada.frecuencia_riego }}</li>
            <li class="list-group-item">🐾 <strong>Mascotas:</strong> {{ florSeleccionada.toxicidad ? 'Tóxica' : 'Segura' }}</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const listaFlores = ref([]);
const florSeleccionada = ref(null);

const cargarFlores = async () => {
  try {
    const response = await axios.get('http://localhost:3000/flores', {
      headers: { 'auth': 'A1B2C3' }
    });
    listaFlores.value = response.data;
  } catch (error) {
    console.error("Error al conectar con la API:", error);
  }
};

const verDetalles = (flor) => {
  florSeleccionada.ref = flor;
};

onMounted(cargarFlores);
</script>

<style scoped>
/* Heredamos tus estilos de style.css */
#main_header { height: 20vh; background-color: #F5D9D5; color: #4f0022; }
.card { background-color: #F5D9D5; border-radius: 14px; cursor: pointer; }
.card:hover { transform: translateY(-6px); box-shadow: 0px 12px 25px rgba(91, 0, 39, 0.25); }
#main_content_home { background-color: #F5D9D5; }
</style>