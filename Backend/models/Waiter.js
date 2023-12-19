const mongoose = require('mongoose');

const waiterSchema = new mongoose.Schema({
    Fname: { type: String, required: true },
    LName: { type: String, required: true },
    Email: { type: String, required: true },
    City: { type: String, required: true },
    Postcode: { type: String, required: true },
    Salary: { type: String, required: true },
    Sex: { type: String, required: true },
    Birthdate: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const auditWaiterSchema = new mongoose.Schema({
    waiter_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Waiter', required: true },
    previous_waiter_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Waiter' },
    Fname: { type: String, required: true },
    previous_Fname: String,
    LName: { type: String, required: true },
    previous_LName: String,
    Email: { type: String, required: true },
    previous_Email: String,
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
  
  const Waiter = mongoose.model('Waiter', waiterSchema);
  const AuditWaiter = mongoose.model('AuditWaiter', auditWaiterSchema);
  
  module.exports = { Waiter, AuditWaiter };
  