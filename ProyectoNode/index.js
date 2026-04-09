require('dotenv').config();
const express = require ('express');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();

app.use(cors({
    origin: '*',
    methods: ['GET','POST','PUT','DELETE','OPTIONS'],
    allowedHeaders: ['Content-Type', 'auth']
}));

app.use(express.json());

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
    port: process.env.DB_PORT || 23492, 
    ssl: {
        rejectUnauthorized: false
    }
});

db.connect(err => {
    if(err){
        console.error('Error al conectar a Mysql:', err);
        return;
    }
    console.log('Conectando a Mysql');
})

const Middleware = (req, res, next) => {
    const pass = req.headers['auth'];
    if (pass === process.env.API_AUTH_KEY) {
        next();
    } else {
        res.status(401).json("Usuario no autorizado");
    }
}

app.get('/flores', Middleware, (req, res) => {
    const query = `
        SELECT f.*, c.luz_solar, c.frecuencia_riego, c.humedad_ideal, 
               c.tipo_suelo, c.temperatura_min, c.temperatura_max, 
               c.dificultad, c.toxicidad, c.poda, c.estacion
        FROM flores f
        LEFT JOIN cuidados c ON f.id = c.id_flor
    `;
    db.query(query, (err, results) => {
        if (err) return res.status(500).json('Error al obtener datos');
        res.json(results);
    });
});

app.post("/flores", Middleware, (req, res) => {
    const{nombre, significado} = req.body;

    if (!nombre || !significado) {
        return res.status(400).json('Datos incompletos');
    }

    db.query('INSERT INTO flores (nombre, significado) VALUES (?,?)',
        [nombre, significado],
        (err) => {
            if (err){
                return res.status(500).json('Error al insertar');
            }
            res.status(201).json('Flor agregada');
        }
    )
})

app.listen(PORT, ()=>{
    console.log("La Api escucha en el puerto: "+ PORT);
})