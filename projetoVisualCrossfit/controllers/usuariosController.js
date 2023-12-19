const Usuario = require('../models/usuarios'); // Substitua pelo caminho correto do seu modelo Sequelize

// Listar todos os usuários
exports.getUsers = async (req, res) => {
    try {
        const usuarios = await Usuario.findAll();
        res.status(200).json(usuarios);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter um usuário pelo ID
exports.getUserById = async (req, res) => {
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        if (usuario) {
            res.status(200).json(usuario);
        } else {
            res.status(404).json({ message: 'Usuário não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter um usuário pelo email
exports.getUserByEmail = async (req, res) => {
    try {
        const usuario = await Usuario.findOne({ where: { email: req.params.email } });
        if (usuario) {
            res.status(200).json(usuario);
        } else {
            res.status(404).json({ message: 'Usuário não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Listar todos os usuários de um determinado grupo
exports.getUsersByGroup = async (req, res) => {
    try {
        const usuarios = await Usuario.findAll({ where: { grupo: req.params.grupo } });
        res.status(200).json(usuarios);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Cadastro de novos usuários
exports.createUser = async (req, res) => {
    try {
        const newUser = await Usuario.create(req.body);
        res.status(201).json(newUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar informações de um usuário
exports.updateUser = async (req, res) => {
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        if (usuario) {
            await usuario.update(req.body);
            res.status(200).json(usuario);
        } else {
            res.status(404).json({ message: 'Usuário não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar um usuário
exports.deleteUser = async (req, res) => {
    try {
        const usuario = await Usuario.findByPk(req.params.id);
        if (usuario) {
            await usuario.destroy();
            res.status(200).json({ message: 'Usuário deletado' });
        } else {
            res.status(404).json({ message: 'Usuário não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
