const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcrypt-nodejs')

/**
* User Schema
*/
const userSchema = new mongoose.Schema({
    Name: {
        type: String,
        required: true
    },
    Contact: {
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
        type: String 
    },
    role: {
        type: String,
        required: true,
        default: 'User'
    },
    created_at: {
        type: Date,
        required: true
    },
    
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
    address: { type: String },
    phone: { type: Number },
    Imageurl: { type: String },
}, { timestamps: true });


// Export the models
const User = mongoose.model('User', userSchema);
const UserAudit = mongoose.model('UserAudit', userAudit);

module.exports = {
    User,
    UserAudit,
};