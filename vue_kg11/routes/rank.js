const express=require('express');
const router=express.Router();
const pool=require("../pool.js");

router.get("/hot",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    if(!pno){
        pno=1;
    }
    if(!pageSize){
        pageSize=5;
    }
    var reg=/^[0-9]{1,}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页码格式不正确"});
        return;
    }
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:"页大小格式不正确"});
        return;
    }
    var obj={pno:pno,pageSize:pageSize};
    var progress=0;
    var lid=parseInt(req.query.lid);
    var sql="select count(lid) as c from kg_songlist where classify_id=?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        var pageCount=Math.ceil(result[0].c/pageSize);
        obj.pageCount=pageCount;    
        progress+=50;               
        if(progress==100){           
            res.send({code:1,msg:obj});
        }
        })
    var sql="SELECT y.ylistname,y.image,x.lname,x.ltime,x.l_singer from kg_songlist x INNER JOIN kg_classify y on y.yid=x.classify_id where classify_id=? limit ?,?";
    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    pool.query(sql,[lid,offset,pageSize],(err,result)=>{
        if(err) throw err;
        obj.data=result; 
        progress+=50;
        if(progress==100){
            res.send({code:1,msg:obj})
        }
    })
});
module.exports=router;