<template>
    <div :class="['container-fluid vh-100', {'slide-up' : isExiting}]" id="main_content">
        <div class="row">
            <div class="col"></div>
            <div class="col-6 d-flex flex-column align-items-center">
                <img src="@/assets/img/logo.jpeg" alt="Logo FloraBloom" class="rounded img-fluid mb-5" id="main_logo">
                <button @click="handleEnter" class="btn btn-primary btn-lg px-5" id="btn_in" >Entrar</button>
            </div>
            <div class="col"></div>
        </div>
    </div>
</template>

<script setup>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';

    const router = useRouter();
    const isExiting =ref(false);

    const handleEnter = () => {
        isExiting.value = true;
        setTimeout(() => {
            router.push('/catalogo');
        }, 800);
    };
</script>

<style scoped>
#main_content {
    background-color: #F5D9D5;
    transition: transform 0.8s ease, opacity 0.8 ease;
}
.slide-up {
    transform: translateY(-100%);
    opacity: 0;
}
#main_logo{
    max-width: 500px;
    max-height: 548px;
}
</style>