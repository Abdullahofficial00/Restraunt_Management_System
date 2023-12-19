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

function validateToken(token) {
  // Check if the token is defined before trying to split it
  if (token) {
      const parts = token.split(' ');
      // Rest of the code...
  } else {
      // Handle the case where the token is undefined
      console.error('Token is undefined');
      // Rest of the error handling...
  }
}
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
  
          // Find the user before the update
          const userBeforeUpdate = await User.findById(userId);
  
          // Save the old and updated data in the userAudit table
          const userAuditData = {
              username1: userBeforeUpdate.username,
              username2: updatedData.username || userBeforeUpdate.username,
              email1: userBeforeUpdate.email,
              email2: updatedData.email || userBeforeUpdate.email,
              password1: userBeforeUpdate.password,
              password2: updatedData.password || userBeforeUpdate.password,
              role: userBeforeUpdate.role,
              role2: updatedData.role || userBeforeUpdate.role,
              address1: userBeforeUpdate.address,
              address2: updatedData.address || userBeforeUpdate.address,
              phone1: userBeforeUpdate.phone,
              phone2: updatedData.phone || userBeforeUpdate.phone,
              Imageurl1: userBeforeUpdate.Imageurl,
              Imageurl2: updatedData.Imageurl || userBeforeUpdate.Imageurl,
          };
  
          // Create an instance of the UserAudit model and save it
          const userAuditEntry = new UserAudit(userAuditData);
          await userAuditEntry.save();
  
          // Update the user
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