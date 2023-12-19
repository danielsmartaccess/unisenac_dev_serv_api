const express = require('express');
const tiposControleTempoController = require('../controllers/tiposControleTempoController');
const router = express.Router();

router.get('/', tiposControleTempoController.getAllTiposControleTempo);
router.get('/:id', tiposControleTempoController.getTipoControleTempoById);
router.post('/', tiposControleTempoController.createTipoControleTempo);
router.put('/:id', tiposControleTempoController.updateTipoControleTempo);
router.delete('/:id', tiposControleTempoController.deleteTipoControleTempo);

module.exports = router;
