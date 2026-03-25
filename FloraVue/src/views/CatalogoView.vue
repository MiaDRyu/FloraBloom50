<template>
  <div class="catalogo-container min-vh-100">
    <header class="main-header bg-primary d-flex align-items-center justify-content-center py-3">
      <img src="@/assets/img/logo.jpeg" alt="Logo" class="logo-mini me-3">
      <h1 class="m-0 text-white">FloraBloom</h1>
    </header>

    <section class="filters-section container mt-4">
      <div class="d-flex justify-content-center gap-2 flex-wrap">
        <button 
          v-for="cat in categorias" 
          :key="cat"
          @click="categoriaSeleccionada = cat"
          :class="['btn', categoriaSeleccionada === cat ? 'btn-primary' : 'btn-outline-primary']"
        >
          {{ cat }}
        </button>
      </div>
    </section>

    <main class="container my-5">
      <div v-if="cargando" class="text-center">
        <div class="spinner-border text-primary" role="status"></div>
        <p>Cargando flores...</p>
      </div>

      <div v-else class="row">
        <div 
          v-for="flor in floresFiltradas" 
          :key="flor.id" 
          class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4"
        >
          <div class="card h-100 shadow-sm" @click="abrirDetalles(flor)">
            <img :src="obtenerRutaImagen(flor.imagen_url)" class="card-img-top" :alt="flor.nombre">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">{{ flor.nombre }}</h5>
              <p class="card-text flex-grow-1">{{ flor.significado }}</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-secondary">{{ flor.categoria }}</span>
                <span class="fw-bold text-white">${{ flor.precio }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>

       <FlorModal 
      :flor="florSeleccionada" 
      @cerrar="florSeleccionada = null" 
      />

      <div v-if="floresFiltradas.length === 0 && !cargando" class="text-center mt-5">
        <p class="h4 text-muted">No encontramos plantas en esta categoría.</p>
      </div>
    </main>

    </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { getFlores } from '../services/FloreriaService';
import  FlorModal  from '../components/FlorModal.vue';

const listaFlores = ref([]);
const cargando = ref(true);
const categoriaSeleccionada = ref('Todas');
const categorias = ['Todas', 'Interior', 'Exterior', 'Suculentas', 'Orquídeas'];

onMounted(async () => {
  try {
    const datos = await getFlores();
    listaFlores.value = datos;
  } catch (error) {
    console.error("Error al cargar el catálogo:", error);
  } finally {
    cargando.value = false;
  }
});

const floresFiltradas = computed(() => {
  if (categoriaSeleccionada.value === 'Todas') return listaFlores.value;
  return listaFlores.value.filter(f => f.categoria === categoriaSeleccionada.value);
});

const obtenerRutaImagen = (nombreImagen) => {
  if (!nombreImagen) return 'https://via.placeholder.com/150';
  return new URL(`../assets/img/${nombreImagen}`, import.meta.url).href;
};

const abrirDetalles = (flor) => {
  florSeleccionada.value = flor;
};
</script>

<style lang="scss" scoped>
.main-header {
  background-color: var(--bs-secondary);
  .logo-mini {
    height: 50px;
    border-radius: 50%;
  }
}

.card {
  background-color: #76191F;
  color: aliceblue;
  cursor: pointer;
  transition: transform 0.2s ease;
  &:hover {
    transform: scale(1.03);
  }
  img {
    height: 200px;
    object-fit: cover;
  }
}

.catalogo-container {
  background-color: #F5D9D5;
}
</style>