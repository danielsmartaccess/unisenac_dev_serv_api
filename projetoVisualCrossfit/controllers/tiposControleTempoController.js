// Importe o modelo TipoControleTempo
const TipoControleTempo = require('../models/tiposControleTempo');

// Obter todos os tipos de controle de tempo
exports.getAllTiposControleTempo = async (req, res) => {
    try {
        const tipos = await TipoControleTempo.findAll();
        res.status(200).json(tipos);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Obter um tipo de controle de tempo pelo ID
exports.getTipoControleTempoById = async (req, res) => {
    try {
        const tipo = await TipoControleTempo.findByPk(req.params.id);
        if (tipo) {
            res.status(200).json(tipo);
        } else {
            res.status(404).json({ message: 'Tipo de Controle de Tempo não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Criar um novo tipo de controle de tempo
exports.createTipoControleTempo = async (req, res) => {
    try {
        const novoTipo = await TipoControleTempo.create(req.body);
        res.status(201).json(novoTipo);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Atualizar um tipo de controle de tempo existente
exports.updateTipoControleTempo = async (req, res) => {
    try {
        const tipo = await TipoControleTempo.findByPk(req.params.id);
        if (tipo) {
            await tipo.update(req.body);
            res.status(200).json(tipo);
        } else {
            res.status(404).json({ message: 'Tipo de Controle de Tempo não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Deletar um tipo de controle de tempo
exports.deleteTipoControleTempo = async (req, res) => {
    try {
        const tipo = await TipoControleTempo.findByPk(req.params.id);
        if (tipo) {
            await tipo.destroy();
            res.status(200).json({ message: 'Tipo de Controle de Tempo deletado' });
        } else {
            res.status(404).json({ message: 'Tipo de Controle de Tempo não encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
