const Sequelize = require('sequelize');
const database = require('../config/database'); // Ajuste para o caminho correto

// Definir o model Exercicio
const Exercicio = database.define('exercicios', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    descricao: {
        type: Sequelize.TEXT,
        allowNull: true
    },
    imagem_url: {
        type: Sequelize.STRING,
        allowNull: true
    }
});

module.exports = Exercicio;
