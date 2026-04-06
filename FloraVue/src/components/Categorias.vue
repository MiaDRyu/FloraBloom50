<template>
    <section class="filters-section container mt-4">
      <div class="d-flex justify-content-center gap-2 flex-wrap">
        <button 
          v-for="cat in categorias" 
          :key="cat"
          @click="$emit('cambiarCat', cat)"
          :class="['btn', seleccionada === cat ? 'btn-primary' : 'btn-outline-primary']"
        >
          {{ cat }}
        </button>
      </div>
    </section>
</template>

<script setup>

defineProps({
  seleccionada: String
});

defineEmits(['cambiarCat']);

const categorias = ['Todas', 'Interior', 'Exterior', 'Suculentas', 'Orquídeas'];

</script>