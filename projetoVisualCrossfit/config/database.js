const Sequelize = require('sequelize');

const sequelize = new Sequelize('cross_visual_academy', 'root', '', {
    host: 'localhost',
    dialect: 'mariadb',
    port: 3307
});

module.exports = sequelize;
