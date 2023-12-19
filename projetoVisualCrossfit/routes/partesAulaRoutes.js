const express = require('express');
const partesAulaController = require('../controllers/partesAulaController');
const router = express.Router();

router.get('/', partesAulaController.getAllPartesAula);
router.get('/:id', partesAulaController.getParteAulaById);
router.post('/', partesAulaController.createParteAula);
router.put('/:id', partesAulaController.updateParteAula);
router.delete('/:id', partesAulaController.deleteParteAula);

module.exports = router;
