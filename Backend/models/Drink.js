const mongoose = require('mongoose');

const drinkSchema = new mongoose.Schema({
    Name: { type: String, required: true },
    Alcohol: { type: String, required: true },
    Type: { type: String, required: true },
    Description: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const auditDrinkSchema = new mongoose.Schema({
    drink_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Drink', required: true },
    previous_drink_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Drink' },
    Name: { type: String, required: true },
    previous_Name: String,
    Alcohol: { type: String, required: true },
    previous_Alcohol: String,
    Type: { type: String, required: true },
    previous_Type: String,
    Description: { type: String, required: true },
    previous_Description: String,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const Drink = mongoose.model('Drink', drinkSchema);
  const AuditDrink = mongoose.model('AuditDrink', auditDrinkSchema);
  
  module.exports = { Drink, AuditDrink };
  