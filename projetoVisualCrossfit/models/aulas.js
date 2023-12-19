const Sequelize = require('sequelize');
const database = require('../config/database'); // Importar a conexão com o banco de dados

// Definir o model Aula
const Aula = database.define('aulas', {
    titulo: {
        type: Sequelize.STRING,
        allowNull: false
    },
    descricao: {
        type: Sequelize.TEXT,
        allowNull: true
    },
    coach_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, {
    timestamps: true // Indica que Sequelize deve gerenciar createdAt e updatedAt
});

module.exports = Aula;
