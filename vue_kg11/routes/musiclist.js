const express=require("express")
const router=express.Router()
const pool=require("../pool")
router.get("/music",(req,res)=>{
  var sql="SELECT `lid`,`lname`,`likes`, `l_singer`,`likes` FROM `kg_songlist`";
  pool.query(sql,(err,result)=>{
  if(err) console.log(err);
  res.send(result);
  }) 
});
router.post("/like",(req,res)=>{
  var ksong=req.body.ksong;
  var ksinger=req.body.ksinger;
  var sql="insert into kg_like values(null,?,?)";
  pool.query(sql,[ksong,ksinger],(err,result)=>{
  if(err) console.log(err);
  res.send(result);
  }) 
});
router.get("/delete",(req,res)=>{
  var ksong=req.query.ksong;
  var sql="DELETE FROM `kg_like` WHERE ksong=?";
  pool.query(sql,[ksong],(err,result)=>{
  if(err) console.log(err);
  res.send(result);
  }) 
});
 router.get("/likelist",(req,res)=>{
  var sql="SELECT * FROM `kg_like`";
  pool.query(sql,(err,result)=>{
  if(err) console.log(err);
  res.send(result);
  }) 
});
 router.post("/updata",(req,res)=>{
  var lid=req.body.lid;
  var likes=req.body.likes;
  var sql="UPDATE kg_songlist SET likes=? WHERE lid=?";
  pool.query(sql,[likes,lid],(err,result)=>{
  if(err) console.log(err);
  res.send(result);
  }) 
});
module.exports=router;