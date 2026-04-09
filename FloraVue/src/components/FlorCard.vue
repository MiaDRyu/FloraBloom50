<template>
    <div class="card h-100 shadow-sm bg-primary text-white" @click="$emit('abrirModal')">
            <img :src="imagenRuta" class="card-img-top" :alt="flor.nombre">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">{{ flor.nombre }}</h5>
              <p class="card-text flex-grow-1">{{ flor.significado }}</p>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-secondary text-black">{{ flor.categoria }}</span>
                <span :class="['badge', flor.stock <= 0 ? 'bg-danger' : 'bg-success']">
                  {{ flor.stock > 0 ? 'Disponible' : 'No disponible' }}
                </span>
                <span class="fw-bold text-white">${{ flor.precio }}</span>
              </div>
            </div>
          </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
  flor: Object
});

defineEmits(['abrirModal']);

const imagenRuta = computed(() => {
  if (!props.flor?.imagen_url) return 'https://via.placeholder.com/150';
  return props.flor.imagen_url;
});
</script>

<style>
.card {
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
</style>