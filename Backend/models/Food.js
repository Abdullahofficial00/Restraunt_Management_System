const mongoose = require('mongoose');

const foodSchema = new mongoose.Schema({
    Name: { type: String, required: true },
    Price: { type: String, required: true },
    Category: { type: String, required: true },
    Image: { type: String, required: true },
    Description: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
    updated_at: { type: Date, default: Date.now },
  });
  
  const auditFoodSchema = new mongoose.Schema({
    food_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Food', required: true },
    previous_food_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Food' },
    Name: { type: String, required: true },
    previous_Name: String,
    Price: { type: String, required: true },
    previous_Price: String,
    Category: { type: String, required: true },
    previous_Category: String,
    Description: { type: String, required: true },
    previous_Description: String,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
    updated_at: { type: Date, default: Date.now },
  });
  
  const Food = mongoose.model('Food', foodSchema);
  const AuditFood = mongoose.model('AuditFood', auditFoodSchema);
  
  module.exports = { Food, AuditFood };
  