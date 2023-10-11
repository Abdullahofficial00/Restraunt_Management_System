const User = require('../models/user');
const dotenv= require('dotenv').config();
//Gnerate token here
const jwt = require('jsonwebtoken'); // Import the jwt library

function GenerateToken(user) {
  const payload = {
    role: user.role,
    id: user._id,
  };
  const token = jwt.sign(payload, process.env.SECRETKEY);
  return token;
};

async function loginuser(req,res){
  try{
    const {email,password}=req.body;
    const user = await User.findOne({email});
    if(!user)
    {
      return res.status(401).json({msg:"User Not Found"});
    }
    if(user.password!=password){
      return res.status(401).json({msg:"Invalid Password"});
    }
    const token = GenerateToken(user);
    return res.status(201).json({user:user,token:token});
  }
  catch(err){
    return res.status(500).json({error:err.message});
  }
}

//Function for Crud
async function admindasbhard(req,res){
  res.status(200).json({message:'welcome to admin'});
}

async function createUser(req, res) {
  try {
    const newUser = await User.create(req.body);
    res.status(201).json({ user: newUser,  message: 'User Added successfully' });
    
  } catch (error) {
    res.status(500).json({ error: error });
  }
}
async function createProduct(req, res) {
  try {
    const newProduct = await User.Product.create(req.body);
    res.status(201).json({ user: newProduct,  message: 'Product Added successfully' });
    
  } catch (error) {
    res.status(500).json({ error: error });
  }
}
async function getAllUser(req, res) {
    try {
      const users = await User.find(); // Use the appropriate method to retrieve all users
      res.status(200).json(users);
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
  // async function loginuser(req, res) {
  //   try {
  //     const { name, password } = req.body;
  //     const user = await User.findOne({ name });
  
  //     if (!user) {
  //       return res.status(404).json({ message: 'User not found' });
  //     }
  //     if (user.password !== password) {
  //       return res.status(401).json({ message: 'Invalid password' });
  //     }
  
  //     // Successful login
  //     res.status(200).json({ message: 'Login successful', user });
  //   } catch (error) {
  //     res.status(500).json({ error: error });
  //   }
  // }

  async function updateUser(req, res) {
    try {
      const userId = req.params.id; // Assuming you're passing the user ID as a route parameter
      const updatedData = req.body; // Data to update the user
  
      const updatedUser = await User.findOneAndUpdate({ _id: userId }, updatedData, { new: true });
  
      if (!updatedUser) {
        return res.status(404).json({ message: 'User not found' });
      }
  
      if (!updatedUser._id) {
        // No updates were made
        return res.status(200).json({ message: 'No updates were made' });
      }
  
      // Updates were made
      console.log('User updated successfully');
      res.status(200).json({ message: 'User updated successfully' });
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
  async function deleteUser(req, res) {
    try {
      const userId = req.params.id; // Assuming you're passing the user ID as a route parameter
  
      const deletedUser = await User.findByIdAndRemove(userId);
  
      if (!deletedUser) {
        return res.status(404).json({ message: 'User not found' });
      }
  
      res.status(200).json({ message: 'User deleted successfully' });
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

module.exports={
    createUser,
    getAllUser,
    updateUser,
    deleteUser,
    loginuser,
    admindasbhard,
    createProduct
}