const express = require('express');
const exerciciosParteController = require('../controllers/exerciciosParteController');
const router = express.Router();

router.get('/', exerciciosParteController.getAllExerciciosPartes);
router.get('/:id', exerciciosParteController.getExercicioParteById);
router.post('/', exerciciosParteController.createExercicioParte);
router.put('/:id', exerciciosParteController.updateExercicioParte);
router.delete('/:id', exerciciosParteController.deleteExercicioParte);

module.exports = router;
