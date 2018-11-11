const express=require("express");
var router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var sql=`select id,img_url,title from kg_image;`
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
})
router.get("/demo",(req,res)=>{
    var no=parseInt(req.query.no);
    var jd=0;
    var resu=[];        
    for(let i=1;i<=no;i++){
        let obj={img:[],slist:[]};                
        (async function(){
            var sql=" SELECT ylistname,yid,image FROM kg_classify WHERE yid=?";
            await new Promise(function(open){
                pool.query(sql,i,(err,result)=>{                    
                    if(err)throw err;
                    obj.img=result[0];   
                    //console.log(obj.img);                             
                    open();
                })
            });             
            var sql="SELECT `lname`,`l_singer` FROM kg_songlist WHERE `classify_id`=? LIMIT 0,3";
            await new Promise(function(open){
                pool.query(sql,i,(err,result)=>{
                    if(err)throw err;                    
                    obj.slist=result;
                    jd+=1;                                
                    resu[i-1]=obj;                    
                    if(jd==no){
                        res.send(resu);              
                      }                                    
                })
            })            
        })()                     
    }           
})
module.exports=router;