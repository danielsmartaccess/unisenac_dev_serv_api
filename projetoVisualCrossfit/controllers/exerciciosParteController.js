const ExercicioParte = require('../models/exerciciosParte'); // Substitua pelo caminho correto do seu modelo

// Obter todas as associações de exercícios e partes das aulas
exports.getAllExerciciosPartes = async (req, res) => {
    try {
        const exerciciosPartes = await ExercicioParte.findAll();
        res.status(200).json(exerciciosPartes);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter uma associação específica pelo ID
exports.getExercicioParteById = async (req, res) => {
    try {
        const exercicioParte = await ExercicioParte.findByPk(req.params.id);
        if (exercicioParte) {
            res.status(200).json(exercicioParte);
        } else {
            res.status(404).json({ message: 'Associação não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Criar uma nova associação
exports.createExercicioParte = async (req, res) => {
    try {
        const novaExercicioParte = await ExercicioParte.create(req.body);
        res.status(201).json(novaExercicioParte);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar uma associação existente
exports.updateExercicioParte = async (req, res) => {
    try {
        const exercicioParte = await ExercicioParte.findByPk(req.params.id);
        if (exercicioParte) {
            await exercicioParte.update(req.body);
            res.status(200).json(exercicioParte);
        } else {
            res.status(404).json({ message: 'Associação não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar uma associação
exports.deleteExercicioParte = async (req, res) => {
    try {
        const exercicioParte = await ExercicioParte.findByPk(req.params.id);
        if (exercicioParte) {
            await exercicioParte.destroy();
            res.status(200).json({ message: 'Associação deletada' });
        } else {
            res.status(404).json({ message: 'Associação não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
