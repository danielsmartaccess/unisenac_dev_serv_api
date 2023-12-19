const express = require('express');
const aulasController = require('../controllers/aulasController');
const router = express.Router();

router.get('/', aulasController.getAllAulas);
router.get('/:id', aulasController.getAulaById);
router.post('/', aulasController.createAula);
router.put('/:id', aulasController.updateAula);
router.delete('/:id', aulasController.deleteAula);

module.exports = router;
