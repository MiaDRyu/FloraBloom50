require('dotenv').config();
const mysql = require('mysql2/promise');
const axios = require('axios');

const API_KEY = process.env.PEXELS_API_KEY;

async function main() {
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,      
        user: process.env.DB_USER,      
        password: process.env.DB_PASS,  
        database: process.env.DB_NAME,  
        port: process.env.DB_PORT || 23492,
        ssl: {
            rejectUnauthorized: false  
        }
    });

    console.log("✅ Conectado exitosamente a la base de datos de AIVEN");

    const [flores] = await connection.execute("SELECT id, nombre FROM flores");

    for (let flor of flores) {
        try {
            const searchQuery = flor.nombre;

            const response = await axios.get('https://api.pexels.com/v1/search', {
                headers: { Authorization: API_KEY },
                params: { query: searchQuery, per_page: 1 }
            });

            if (response.data.photos.length > 0) {
                const imageUrl = response.data.photos[0].src.medium;

                await connection.execute(
                    "UPDATE flores SET imagen_url = ? WHERE id = ?",
                    [imageUrl, flor.id]
                );

                console.log(`🌸 ${flor.nombre} → Actualizada con éxito`);
            } else {
                console.log(`⚠️ ${flor.nombre} → No se encontró imagen en Pexels`);
            }

            await new Promise(resolve => setTimeout(resolve, 200)); 

        } catch (error) {
            console.log(`❌ Error con ${flor.nombre}:`, error.message);
        }
    }

    await connection.end();
}

main();