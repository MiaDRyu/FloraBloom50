<template>
  <div class="catalogo-container min-vh-100">
    <Header/>
    
    <Categorias
    :seleccionada="categoriaSeleccionada"
    @cambiarCat = "actualizarCategoria"
    />
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
          <FlorCard
          :flor="flor"
          @abrirModal="abrirDetalles(flor)"
          />
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
import FlorCard from '../components/FlorCard.vue';
import Header from '../components/Header.vue';
import Categorias from '../components/Categorias.vue';

const listaFlores = ref([]);
const florSeleccionada =ref(null);
const cargando = ref(true);
const categoriaSeleccionada = ref('Todas');

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

const actualizarCategoria = (nuevaCat) => {
  categoriaSeleccionada.value = nuevaCat;
};

const floresFiltradas = computed(() => {
  if (categoriaSeleccionada.value === 'Todas') return listaFlores.value;
  return listaFlores.value.filter(f => f.categoria === categoriaSeleccionada.value);
});

const abrirDetalles = (flor) => {
  florSeleccionada.value = flor;
};
</script>

<style lang="scss" scoped>
.catalogo-container {
  background-color: #F5D9D5;
}
</style>