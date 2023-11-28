const nodemailer = require("nodemailer");
const {User,userAudit} = require('../models/User');
const dotenv= require('dotenv').config();
const validator = require('validator');
const jwt = require('jsonwebtoken'); // Import the jwt library



// async function forgot(req, res) {
//   try {
//     const { email } = req.body;
//     const user = await User.findOne({ email });

//     if (!user) {
//       return res.status(401).json({ msg: "User Not Found" });
//     } else {
//       // Send the existing password to the user's email
//       const transporter = nodemailer.createTransport({
//         // Your email configuration here
//         // Example using Gmail:
//         service: 'gmail',
//         auth: {
//           user: 'mabdullahamanat2810@gmail.com',
//           pass: 'Kasuri#2810',
//         },
//       });

//       const info = await transporter.sendMail({
//         from: '"Foody Moody" <mabdullahamanat2810@gmail.com>',
//         to: user.email,
//         subject: "Forgot Password",
//         text: `Your password is: ${user.password}`,
//         html: `<b>Your password is: ${user.password}</b>`,
//       });

//       console.log("Message sent: %s", info.messageId);
//       return res.status(200).json({ msg: "Password sent to the user's email" });
//     }
//   } catch (err) {
//     console.error("Error:", err.message);
//     return res.status(500).json({ error: err.message });
//   }
// }

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

async function admindasbhard(req,res){
  res.status(200).json({message:'welcome to admin'});
}

async function createUser(req, res) {
  try {
    if (!validator.isEmail(req.body.email)) {
      return res.status(400).json({ message: 'Invalid email address' });
    }

    const existingUsername = await User.findOne({ email: req.body.email });
    if (existingUsername) {
      return res.status(400).json({ message: 'Username already exists' });
    }

    const existingEmail = await User.findOne({ email: req.body.email });
    if (existingEmail) {
      return res.status(400).json({ message: 'Email already exists' });
    }
    const newUser = await User.create(req.body);
    res.status(201).json({ user: newUser, message: 'User added successfully' });

  } catch (error) {
    res.status(500).json({ error: error.message });
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

  async function updateUser(req, res) {
    try {
      const userId = req.params.id;
      const updatedData = req.body; 
  
      const updatedUser = await User.findOneAndUpdate({ _id: userId }, updatedData, { new: true });
  
      if (!updatedUser) {
        return res.status(404).json({ message: 'User not found' });
      }
  
      if (!updatedUser._id) {
        return res.status(200).json({ message: 'No updates were made' });
      }
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
    //forgot,
    
}