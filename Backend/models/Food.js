const mongoose = require('mongoose')

const FoodsSchema = new mongoose.Schema({
    Name: {
        type: String,
        required: true
    },
    Price: {
        type: String,
        required: true
    },
    Category : {
        type: String,
        required: true
    },
	Description : {
        type: String,
        required: true
    },
},
{ timestamps: true },
)

const Food = mongoose.model('Food', FoodsSchema);

module.exports = Food