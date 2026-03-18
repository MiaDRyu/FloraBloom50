<template>
  <div id="main_content" class="container-fluid">
    <div class="row px-4 py-4">
      <div v-for="flor in flores" :key="flor.id" class="col-md-3 mb-4">
        <div class="card" @click="abrirDetalle(flor)">
          <img :src="flor.imagen_url" class="card-img-top" :alt="flor.nombre">
          <div class="card-body">
            <h5 class="card-title">{{ flor.nombre }}</h5>
            <p class="card-text text-muted">{{ flor.categoria }}</p>
            <p class="fw-bold">${{ flor.precio }}</p>
          </div>
        </div>
      </div>
    </div>

    <div v-if="florSeleccionada" class="modal-backdrop fade show"></div>
    <div v-if="florSeleccionada" class="modal fade show d-block" tabindex="-1">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ florSeleccionada.nombre }}</h5>
            <button type="button" class="btn-close" @click="florSeleccionada = null"></button>
          </div>
          <div class="modal-body text-center">
            <img :src="florSeleccionada.imagen_url" id="flowerModalImage" class="img-fluid mb-3 rounded">
            <p><strong>Significado:</strong> {{ florSeleccionada.significado }}</p>
            <hr>
            <h6>Guía de Cuidados Profesionales</h6>
            <ul class="list-group text-start">
              <li class="list-group-item">☀️ <strong>Luz:</strong> {{ florSeleccionada.luz_solar }}</li>
              <li class="list-group-item">💧 <strong>Riego:</strong> {{ florSeleccionada.frecuencia_riego }}</li>
              <li class="list-group-item">🌡️ <strong>Temp:</strong> {{ florSeleccionada.temperatura_min }} - {{ florSeleccionada.temperatura_max }}</li>
              <li class="list-group-item">🐾 <strong>Mascotas:</strong> {{ florSeleccionada.toxicidad ? '⚠️ Tóxica' : '✅ Segura' }}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { getFlores } from '../services/FloreriaService';

const flores = ref([]);
const florSeleccionada = ref(null);

onMounted(async () => {
  try {
    const response = await getFlores();
    flores.value = response.data;
  } catch (error) {
    console.error("Error cargando el catálogo:", error);
  }
});

const abrirDetalle = (flor) => {
  florSeleccionada.value = flor;
};
</script>