const mongoose = require('mongoose');

const customerSchema = new mongoose.Schema({
    Fname: { type: String, required: true },
    LName: { type: String, required: true },
    Contact: { type: String, required: true },
    Email: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const auditCustomerSchema = new mongoose.Schema({
    customer_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Customer', required: true },
    previous_customer_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Customer' },
    Fname: { type: String, required: true },
    previous_Fname: String,
    LName: { type: String, required: true },
    previous_LName: String,
    Contact: { type: String, required: true },
    previous_Contact: String,
    Email: { type: String, required: true },
    previous_Email: String,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const Customer = mongoose.model('Customer', customerSchema);
  const AuditCustomer = mongoose.model('AuditCustomer', auditCustomerSchema);
  
  module.exports = { Customer, AuditCustomer };
  