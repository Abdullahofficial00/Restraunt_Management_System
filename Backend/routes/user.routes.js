const express=require('express');
const router = express.Router();
const userController=require('../controllers/user.controller');
const { validateToken, requireRoles } = require('../utils/authmiddleware');

router.post('/admin', validateToken, userController.admindasbhard);
router.post('/user',userController.createUser);
router.get('/user',userController.getAllUser);
router.put('/user/:id',validateToken,userController.updateUser);
router.delete('/user/:id',validateToken,userController.deleteUser);
router.post('/login/',userController.loginuser);
router.get('/auth',validateToken,requireRoles(['admin','Student']),(req,res)=>{return res.status(201).json({msg:"Validation completed"});});
// router.post('/product',userController.createProduct);
// router.get('/product',userController.getAllProducts);

//router.post('/forgot/',userController.forgot);

// if you want to insert the data into database we use post request
// if you want to get the data from database we use get request
// if you want to update the data into database we use post request
// if you want to delete the data into database we use post request

module.exports=router;