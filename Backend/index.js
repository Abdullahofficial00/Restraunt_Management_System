const express=require('express');
const bodyparser=require('body-parser');
const userRouter=require('./routes/user.routes');
const emailRouter=require('./routes/email.routes');
const foodRouter=require('./routes/food.routes');
const imageRouter=require('./routes/image.routes');
const cors = require ('cors');
const mongoose = require('mongoose');


//const cors=require('cors');
const app = express();
const PORT=3000;
require('./utils/mongodb')

const path = require("path")
// const hbs = require("hbs")
// const templatepath = path.join(__dirname,'../templates')

app.use(express.json());
app.use(bodyparser.json());
app.use(cors());
app.use('/api', userRouter);
app.use('/api', emailRouter);
app.use('/api', foodRouter);
app.use('/api', imageRouter);

app.get('/',(req,res) => {
    res.send('Hello World!');
})

app.listen(PORT,()=>{
    console.log("connected");
    console.log('Mongoose version:', mongoose.version);
})