const ParteAula = require('../models/partesAula'); // Substitua pelo caminho correto do seu modelo

// Obter todas as partes das aulas
exports.getAllPartesAula = async (req, res) => {
    try {
        const partes = await ParteAula.findAll();
        res.status(200).json(partes);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter uma parte da aula pelo ID
exports.getParteAulaById = async (req, res) => {
    try {
        const parte = await ParteAula.findByPk(req.params.id);
        if (parte) {
            res.status(200).json(parte);
        } else {
            res.status(404).json({ message: 'Parte da aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Criar uma nova parte da aula
exports.createParteAula = async (req, res) => {
    try {
        const novaParte = await ParteAula.create(req.body);
        res.status(201).json(novaParte);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar uma parte da aula existente
exports.updateParteAula = async (req, res) => {
    try {
        const parte = await ParteAula.findByPk(req.params.id);
        if (parte) {
            await parte.update(req.body);
            res.status(200).json(parte);
        } else {
            res.status(404).json({ message: 'Parte da aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar uma parte da aula
exports.deleteParteAula = async (req, res) => {
    try {
        const parte = await ParteAula.findByPk(req.params.id);
        if (parte) {
            await parte.destroy();
            res.status(200).json({ message: 'Parte da aula deletada' });
        } else {
            res.status(404).json({ message: 'Parte da aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
