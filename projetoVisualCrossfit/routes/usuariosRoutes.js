// Autor: Daniel Steinbruch Pereira 

const express = require('express');
const usuariosController = require('../controllers/usuariosController');
const router = express.Router();

// Listar todos os usuários
router.get('/', usuariosController.getUsers);

// Obter um usuário pelo ID
router.get('/:id', usuariosController.getUserById);

// Obter um usuário pelo email
router.get('/email/:email', usuariosController.getUserByEmail);

// Listar todos os usuários de um determinado grupo
router.get('/grupo/:grupo', usuariosController.getUsersByGroup);

// Cadastro de novos usuários
router.post('/', usuariosController.createUser);

// Atualizar informações de um usuário
router.put('/:id', usuariosController.updateUser);

// Deletar um usuário
router.delete('/:id', usuariosController.deleteUser);

module.exports = router;
