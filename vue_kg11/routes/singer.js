const express=require('express');
const router=express.Router();
const pool=require("../pool.js");
router.get('/singer',(req,res)=>{
    var jd=0;
    var resu=[];        
    for(let i=1;i<=26;i++){
        let obj={title:[],slist:[]};                
        (async function(){
            var sql=" SELECT stitle FROM kg_singer WHERE snum=?";
            await new Promise(function(open){
                pool.query(sql,i,(err,result)=>{                    
                    if(err)throw err;
                    obj.title=result[0];                              
                    open();
                })
            });             
            var sql="SELECT sid,singname,simg,stitle FROM kg_singer WHERE snum=?";
            await new Promise(function(open){
                pool.query(sql,i,(err,result)=>{
                    if(err)throw err;                    
                    obj.slist=result;
                    jd+=1;                                
                    resu[i-1]=obj;                    
                    if(jd==26){
                        res.send(resu); 
                      }                                    
                })
            })            
        })()                     
    }    
});
module.exports=router;