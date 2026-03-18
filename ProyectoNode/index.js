const express = require ('express');
const cors = require('cors');
const mysql = require('mysql2');
const app = express();
const PORT = 3000;

app.use(cors({
    origin: '*',
    methods: ['GET','POST','PUT','DELETE','OPTIONS'],
    allowedHeaders: ['Content-Type', 'auth']
}));

app.use(express.json());

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'MiaSQL123*',
    database: 'floreria'
});

db.connect(err => {
    if(err){
        console.error('Error al conectar a Mysql:', err);
        return;
    }
    console.log('Conectando a Mysql');
})

/*var json = [
    {nombre:"mayelo", edad:23, calificaciones: [5,9,10,8]},
    {nombre:"Mia", edad:20, calificaciones: [8,9,10,8]},
    {nombre:"Vanessa", edad:19, calificaciones: [10,9,10,10]},
]*/

const Middleware = (req,res,next) => {

    var pass = req.headers['auth'];
    const clave = "A1B2C3";
    
    if(pass === clave){
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

// El GET '/' que ya tienes podrías dejarlo como un saludo de la API
app.get('/', (req, res) => res.send("API de FloraBloom operando"));

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