const express=require('express');
const bodyParser=require('body-parser');
const rank=require('./routes/rank');
const musiclist=require('./routes/musiclist');
const register=require('./routes/register');
const login=require('./routes/login');
const imagelist=require('./routes/imagelist');
const singer=require('./routes/singer');
var app=express();
app.use(bodyParser.urlencoded({extended:false}));
const cors=require("cors");
app.use(cors({
    origin:["http://58.87.107.202:5003"],
    credentials:true
}));
app.listen(5001);
app.use(express.static(__dirname+"/static"));
app.use("/rank",rank);
app.use("/musiclist",musiclist);
app.use("/register",register);
app.use("/login",login);
app.use("/imagelist",imagelist);
app.use("/singer",singer);
