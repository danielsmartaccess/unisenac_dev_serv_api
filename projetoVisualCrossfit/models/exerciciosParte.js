const Sequelize = require('sequelize');
const database = require('../config/database'); // Importa a configuração da conexão com o banco de dados

// Definir o model exerciciosParte
const ExercicioParte = database.define('exerciciosParte', {
    parte_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: 'partes_aula', // Nome da tabela 'partes_aula'
            key: 'id'
        }
    },
    exercicio_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: 'exercicios', // Nome da tabela 'exercicios'
            key: 'id'
        }
    }
}, {
    timestamps: true // Desativa os timestamps se não forem necessários
});

module.exports = ExercicioParte;
