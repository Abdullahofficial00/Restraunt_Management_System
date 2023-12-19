const mongoose = require('mongoose');

const BookingSchema = new mongoose.Schema({
    Date: { type: String, required: true },
    time: { type: String, required: true },
    number_place: { type: String, required: true },
    CustomerID: Number,
    created_at: { type: Date, default: Date.now },
  });
  
  const AuditBookingSchema = new mongoose.Schema({
    booking_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Booking', required: true },
    previous_booking_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Booking' },
    Date: { type: String, required: true },
    previous_Date: String,
    time: { type: String, required: true },
    previous_time: String,
    number_place: { type: String, required: true },
    previous_number_place: String,
    CustomerID: Number,
    previous_CustomerID: Number,
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    created_at: { type: Date, default: Date.now },
  });
  
  const Booking = mongoose.model('Booking', BookingSchema);
  const AuditBooking = mongoose.model('AuditBooking', AuditBookingSchema);
  
  module.exports = { Booking, AuditBooking };
  