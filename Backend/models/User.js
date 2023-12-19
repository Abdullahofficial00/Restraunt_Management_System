const mongoose = require('mongoose');
const validator = require('validator');
//const bcrypt = require('bcrypt-nodejs')

/**
* User Schema
*/
const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true
    },
    phone: {
        type: String,
    },
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    address: { 
        type: String,
        default: 'On-site'
    },
    role: {
        type: String,
        default: 'User'
    }
    
},
{ timestamps: true },
{
    collection: 'userInfo'
},
)


// User Schema
const userAudit = mongoose.Schema({
    username1: { type: String, required: true },
    username2: { type: String, required: true },
    email1: { type: String, required: true },
    email2: { type: String, required: true },
    password1: { type: String },
    password2: { type: String },
    role: { type: String },
    role2: { type: String },
    address: { type: String },
    address2: { type: String },
    phone: { type: Number },
    phone2: { type: Number },
    Imageurl: { type: String },
    Imageurl2: { type: String },
}, { timestamps: true });


// Export the models
const User = mongoose.model('User', userSchema);
const UserAudit = mongoose.model('UserAudit', userAudit);

module.exports = {
    User,
    UserAudit,
};