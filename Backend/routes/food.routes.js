const express=require('express');
const router = express.Router();
const foodController=require('../controllers/food.controller');
const { validateToken, requireRoles } = require('../utils/authmiddleware');

router.post('/dashboard', validateToken, foodController.fooddasbhard);
router.post('/food',foodController.createFood);
router.get('/food',foodController.getAllFood);
router.put('/food/:id',validateToken,foodController.updateFood);
router.delete('/food/:id',validateToken,foodController.deleteFood);

module.exports=router;