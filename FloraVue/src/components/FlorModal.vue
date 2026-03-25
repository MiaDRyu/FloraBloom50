<template>
  <div v-if="flor" class="modal fade show d-block" tabindex="-1" style="background: rgba(0,0,0,0.7); z-index: 1055;">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content border-0 shadow-lg">
        
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">{{ flor.nombre }}</h5>
          <button type="button" class="btn-close btn-close-white" @click="$emit('cerrar')"></button>
        </div>

        <div class="modal-body p-4">
          <div class="row">
            <div class="col-md-5 text-center">
              <img :src="imagenRuta" class="img-fluid rounded shadow-sm" style="max-height: 300px; object-fit: cover;">
              <div class="mt-3">
                <span class="badge bg-info text-dark me-2">{{ flor.categoria }}</span>
                <span :class="['badge', flor.toxicidad ? 'bg-danger' : 'bg-success']">
                  {{ flor.toxicidad ? '🐾 Tóxica' : '🐾 Segura' }}
                </span>
              </div>
            </div>

            <div class="col-md-7">
              <h6 class="text-primary fw-bold">Guía de Cuidados</h6>
              <div class="row g-2">
                <div class="col-6 border rounded p-2 bg-light">
                  <small class="d-block fw-lighter">LUZ</small>
                  <span>{{ flor.luz_solar }}</span>
                </div>
                <div class="col-6 border rounded p-2 bg-light">
                  <small class="d-block fw-lighter">RIEGO</small>
                  <span>{{ flor.frecuencia_riego }}</span>
                </div>
                </div>
              <p class="mt-3 small"><strong>Poda:</strong> {{ flor.poda }}</p>
            </div>
          </div>
        </div>

        <div class="modal-footer border-0">
          <h4 class="text-primary me-auto">${{ flor.precio }}</h4>
          <button type="button" class="btn btn-primary" @click="$emit('cerrar')">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
  flor: Object
});

defineEmits(['cerrar']);

const imagenRuta = computed(() => {
  if (!props.flor?.imagen_url) return 'https://via.placeholder.com/150';
  return new URL(`../assets/img/${props.flor.imagen_url}`, import.meta.url).href;
});
</script>