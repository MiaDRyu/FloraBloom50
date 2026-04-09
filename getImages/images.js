require('dotenv').config();
const mysql = require('mysql2/promise');
const axios = require('axios');

const API_KEY = process.env.PEXELS_API_KEY;

async function main() {
    const connection = await mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: 'MiaSQL123*',
        database: 'floreria'
    });

    console.log("✅ Conectado a MySQL");

    const [flores] = await connection.execute("SELECT id, nombre FROM flores");

    for (let flor of flores) {
        try {
            const query = flor.nombre + " flower";

            const response = await axios.get('https://api.pexels.com/v1/search', {
                headers: {
                    Authorization: API_KEY
                },
                params: {
                    query: query,
                    per_page: 1
                }
            });

            if (response.data.photos.length > 0) {
                const imageUrl = response.data.photos[0].src.medium;

                await connection.execute(
                    "UPDATE flores SET imagen_url = ? WHERE id = ?",
                    [imageUrl, flor.id]
                );

                console.log(`${flor.nombre} → OK`);
            } else {
                console.log(`${flor.nombre} → sin imagen`);
            }

        } catch (error) {
            console.log(`Error con ${flor.nombre}`, error.message);
        }
    }

    await connection.end();
    console.log("Proceso terminado");
}

main();