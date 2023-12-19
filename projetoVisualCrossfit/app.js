const express = require('express');
const bodyParser = require('body-parser');
const database = require('./config/database'); // Certifique-se de que o caminho está correto
const exerciciosRoutes = require('./routes/exerciciosRoutes');
const tiposControleTempoRoutes = require('./routes/tiposControleTempoRoutes');
const aulasRoutes = require('./routes/aulasRoutes');
const partesAulaRoutes = require('./routes/partesAulaRoutes');
const usuariosRoutes = require('./routes/usuariosRoutes');
const cors = require('cors');
// Outras importações necessárias...

const app = express();

app.use(bodyParser.json());

app.use('/exercicios', exerciciosRoutes);
app.use('/tipos-controle-tempo', tiposControleTempoRoutes);
app.use('/aulas', aulasRoutes);
app.use('/partes-aula', partesAulaRoutes);
app.use('/usuarios', usuariosRoutes);
app.use(cors()); // Permite que qualquer origem acesse a API
//app.use(cors({ origin: 'http://127.0.0.1:5500' })); // sendo bem específico

// Outras rotas...

database.sync().then(() => {
    console.log("Banco de dados conectado com sucesso");
}).catch(err => {
    console.error('Erro ao conectar ao banco de dados:', err);
});

const PORT = 3001; // Ou a porta que deseja usar
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
