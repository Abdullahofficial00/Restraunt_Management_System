const express=require('express');
const bodyparser=require('body-parser');
const userRouter=require('./routes/userrouts');
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

app.get('/',(req,res) => {
    res.send('Hello World!');
})

app.listen(PORT,()=>{
    console.log("connected");
    console.log('Mongoose version:', mongoose.version);
})