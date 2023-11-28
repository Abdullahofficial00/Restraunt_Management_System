const mongoose = require ("mongoose");
const User = require('../models/User');
mongoose.set('strictQuery', true);

mongoose.connect('mongodb://127.0.0.1:27017/MoodyFoody', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(()=>{
    console.log("Mongo DB Connnected")
})
.catch(()=>{
    console.log("Failed Mongo")
})

