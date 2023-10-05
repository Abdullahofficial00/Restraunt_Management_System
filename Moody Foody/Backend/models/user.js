const mongoose = require('mongoose');

// User Schema
const userSchema = mongoose.Schema({
    username: { type: String, required: true },
    email: { type: String, required: true },
    password: { type: String },
    role: { type: String },
    address: { type: String },
    phone: { type: Number },
    Imageurl: { type: String },
}, { timestamps: true });
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

// Product Schema
const productSchema = mongoose.Schema({
    name: { type: String, required: true },
    price: { type: Number, required: true },
    description: { type: String },
    category: { type: String },
    Imagelink:{ type: String }
}, { timestamps: true });

// Order Schema
const orderSchema = mongoose.Schema({
    username: { type: String, required: true },
    price: { type: Number, required: true },
    description: { type: String },
    category: { type: String },
    Imagelink:{ type: String }
}, { timestamps: true });
// Export the models
const User = mongoose.model('User', userSchema);
const Product = mongoose.model('Product', productSchema);

module.exports = {
    User,
    Product
};
