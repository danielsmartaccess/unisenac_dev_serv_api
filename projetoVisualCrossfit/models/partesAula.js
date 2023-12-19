const Sequelize = require('sequelize');
const database = require('../config/database');

// Definir o model partesAula
const ParteAula = database.define('partesAula', {
    aula_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    tipo_tempo_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    duracao: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    ordem: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});

module.exports = ParteAula;
