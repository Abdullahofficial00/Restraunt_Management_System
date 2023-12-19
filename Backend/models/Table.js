const mongoose = require('mongoose');

const tableSchema = new mongoose.Schema({
    Name: { type: String, required: true },
    NumberPlace: { type: String, required: true },
    Type: { type: String, required: true },
    Description: { type: String, required: true },
    created_at: { type: Date, default: Date.now },
    CustomerID: Number,
    BillID: Number,
  });
  
  const auditTableSchema = new mongoose.Schema({
    table_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Table', required: true },
    previous_table_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Table' },
    Name: { type: String, required: true },
    previous_Name: String,
    NumberPlace: { type: String, required: true },
    previous_NumberPlace: String,
    Type: { type: String, required: true },
    previous_Type: String,
    Description: { type: String, required: true },
    previous_Description: String,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    CustomerID: Number,
    previous_CustomerID: Number,
    BillID: Number,
    previous_BillID: Number,
    created_at: { type: Date, default: Date.now },
  });
  
  const Table = mongoose.model('Table', tableSchema);
  const AuditTable = mongoose.model('AuditTable', auditTableSchema);
  
  module.exports = { Table, AuditTable };
  