const Sequelize = require('sequelize');
const database = require('../config/database');

const Usuario = database.define('usuarios', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    senha_hash: {
        type: Sequelize.STRING,
        allowNull: false
    },
    tipo: {
        type: Sequelize.ENUM('coach', 'aluno'),
        allowNull: false
    }
}, {
    timestamps: true // Indica que Sequelize deve gerenciar createdAt e updatedAt
});

module.exports = Usuario;
