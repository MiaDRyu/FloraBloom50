import axios from 'axios';

const API_URL = 'https://florabloom-li9i.onrender.com';

export const getFlores = async () => {
    try {
        const response = await axios.get(`${API_URL}/flores`, {
            headers: {
                'auth': 'A1B2C3'
            }
        });
        return response.data;
    } catch (error) {
        console.error("Error en la petición:", error);
        throw error;
    }
};