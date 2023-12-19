const mongoose = require('mongoose');

const BillSchema = new mongoose.Schema({
    Sub_Total: { type: String, required: true },
    Vat: { type: String, required: true },
    Total: { type: String, required: true },
    drink_id: Number,
    waiter_id: Number,
    food_id: Number,
    table_id: Number,
    CustomerID: Number,
    created_at: { type: Date, default: Date.now },
  });
  
  const AuditBillSchema = new mongoose.Schema({
    bill_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Bill', required: true },
    previous_bill_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Bill' },
    Sub_Total: { type: String, required: true },
    previous_Sub_Total: String,
    Vat: { type: String, required: true },
    previous_Vat: String,
    Total: { type: String, required: true },
    previous_Total: String,
    drink_id: Number,
    previous_drink_id: Number,
    waiter_id: Number,
    previous_waiter_id: Number,
    food_id: Number,
    previous_food_id: Number,
    table_id: Number,
    previous_table_id: Number,
    CustomerID: Number,
    previous_CustomerID: Number,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const Bill = mongoose.model('Bill', BillSchema);
  const AuditBill = mongoose.model('AuditBill', AuditBillSchema);
  
  module.exports = { Bill, AuditBill };