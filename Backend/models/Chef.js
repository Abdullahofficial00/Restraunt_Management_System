const mongoose = require('mongoose');

const chefSchema = new mongoose.Schema({
    Fname: { type: String, required: true },
    LName: { type: String, required: true },
    Email: { type: String, required: true },
    Experience: { type: String, required: true },
    Type: { type: String, required: true },
    City: { type: String, required: true },
    Postcode: { type: String, required: true },
    Salary: { type: String, required: true },
    Sex: { type: String, required: true },
    Birthdate: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const auditChefSchema = new mongoose.Schema({
    chef_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Chef', required: true },
    previous_chef_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Chef' },
    Fname: { type: String, required: true },
    previous_Fname: String,
    LName: { type: String, required: true },
    previous_LName: String,
    Email: { type: String, required: true },
    previous_Email: String,
    Experience: { type: String, required: true },
    previous_Experience: String,
    Type: { type: String, required: true },
    previous_Type: String,
    City: { type: String, required: true },
    previous_City: String,
    Postcode: { type: String, required: true },
    previous_Postcode: String,
    Salary: { type: String, required: true },
    previous_Salary: String,
    Sex: { type: String, required: true },
    previous_Sex: String,
    Birthdate: { type: String, required: true },
    previous_Birthdate: String,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const Chef = mongoose.model('Chef', chefSchema);
  const AuditChef = mongoose.model('AuditChef', auditChefSchema);
  
  module.exports = { Chef, AuditChef };
  