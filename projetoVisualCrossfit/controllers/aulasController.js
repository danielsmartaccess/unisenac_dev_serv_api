const Aula = require('../models/aulas'); // Importar o model Aula

// Obter todas as aulas
exports.getAllAulas = async (req, res) => { 
    try {
        const aulas = await Aula.findAll();
        res.status(200).json(aulas);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter uma aula pelo ID
exports.getAulaById = async (req, res) => {
    try {
        const aula = await Aula.findByPk(req.params.id);
        if (aula) {
            res.status(200).json(aula);
        } else {
            res.status(404).json({ message: 'Aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Criar uma nova aula
exports.createAula = async (req, res) => {
    try {
        const novaAula = await Aula.create(req.body);
        res.status(201).json(novaAula);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar uma aula existente
exports.updateAula = async (req, res) => {
    try {
        const aula = await Aula.findByPk(req.params.id);
        if (aula) {
            await aula.update(req.body);
            res.status(200).json(aula);
        } else {
            res.status(404).json({ message: 'Aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar uma aula
exports.deleteAula = async (req, res) => {
    try {
        const aula = await Aula.findByPk(req.params.id);
        if (aula) {
            await aula.destroy();
            res.status(200).json({ message: 'Aula deletada' });
        } else {
            res.status(404).json({ message: 'Aula não encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
