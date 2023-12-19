const Sequelize = require('sequelize');
const database = require('../config/database');

const TipoControleTempo = database.define('tiposControleTempo', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    descricao: {
        type: Sequelize.TEXT,
        allowNull: true
    }
});

module.exports = TipoControleTempo;
