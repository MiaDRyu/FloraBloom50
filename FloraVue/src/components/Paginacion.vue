<template>
  <nav aria-label="Navegación de flores" v-if="totalPaginas > 1">
    <ul class="pagination justify-content-center mt-4">
      <li :class="['page-item', { disabled: paginaActual === 1 }]">
        <button class="page-link" @click="$emit('cambiarPagina', paginaActual - 1)">
          Anterior
        </button>
      </li>

      <li 
        v-for="p in totalPaginas" 
        :key="p" 
        :class="['page-item', { active: paginaActual === p }]"
      >
        <button class="page-link" @click="$emit('cambiarPagina', p)">
          {{ p }}
        </button>
      </li>

      <li :class="['page-item', { disabled: paginaActual === totalPaginas }]">
        <button class="page-link" @click="$emit('cambiarPagina', paginaActual + 1)">
          Siguiente
        </button>
      </li>
    </ul>
  </nav>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
  totalItems: Number,
  itemsPorPagina: { type: Number, default: 15 }, // Tus 15 flores por página
  paginaActual: Number
});

defineEmits(['cambiarPagina']);

const totalPaginas = computed(() => Math.ceil(props.totalItems / props.itemsPorPagina));
</script>

<style scoped>
.page-link {
  color: #4f0022; 
  border-color: #F5D9D5;
}
.page-item.active .page-link {
  background-color: #4f0022;
  border-color: #4f0022;
  color: white;
}
</style>