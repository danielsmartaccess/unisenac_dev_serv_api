const express = require('express');
const exerciciosController = require('../controllers/exerciciosController');
const router = express.Router();

router.get('/', exerciciosController.getAllExercicios);
router.get('/:id', exerciciosController.getExercicioById);
router.post('/', exerciciosController.createExercicio);
router.put('/:id', exerciciosController.updateExercicio);
router.delete('/:id', exerciciosController.deleteExercicio);

module.exports = router;
