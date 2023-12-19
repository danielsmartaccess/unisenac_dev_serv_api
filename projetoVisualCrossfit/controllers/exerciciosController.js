// Importe o modelo Exercicio
const Exercicio = require('../models/exercicios');

// Obter todos os exercícios
exports.getAllExercicios = async (req, res) => {
    try {
        const exercicios = await Exercicio.findAll();
        res.status(200).json(exercicios);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter um exercício pelo ID
exports.getExercicioById = async (req, res) => {
    try {
        const exercicio = await Exercicio.findByPk(req.params.id);
        if (exercicio) {
            res.status(200).json(exercicio);
        } else {
            res.status(404).json({ message: 'Exercício não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Criar um novo exercício
exports.createExercicio = async (req, res) => {
    try {
        const novoExercicio = await Exercicio.create(req.body);
        res.status(201).json(novoExercicio);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar um exercício existente
exports.updateExercicio = async (req, res) => {
    try {
        const exercicio = await Exercicio.findByPk(req.params.id);
        if (exercicio) {
            await exercicio.update(req.body);
            res.status(200).json(exercicio);
        } else {
            res.status(404).json({ message: 'Exercício não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar um exercício
exports.deleteExercicio = async (req, res) => {
    try {
        const exercicio = await Exercicio.findByPk(req.params.id);
        if (exercicio) {
            await exercicio.destroy();
            res.status(200).json({ message: 'Exercício deletado' });
        } else {
            res.status(404).json({ message: 'Exercício não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
