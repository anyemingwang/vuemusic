<template>
    <div class="app_list">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media" v-for="(item,i) in list">
			<p class="singname">{{i+1}}.{{item.lname}} - {{item.l_singer}}</p>
            <span class="right">
                <img class="image" src="../../common/img/icons/xiaoxinxinh.png"  @click="addlike(i)" v-if="item.likes==0">
                <img class="image" src="../../common/img/icons/xiaoxinxinhr.png"  @click="downlike(i)" v-else>
                </img>
            </span>
            </li>
        </ul>
    </div>
</template>
 <script scoped>
import {Toast} from "mint-ui";
import {mapActions} from 'vuex'
    export default{
        data(){
            return {
                list:[], 
            }
        },
        methods:{
            addlike:function(i){
                this.$store.commit("increment");
                var res={likes:1,lid:this.list[i].lid}
                var url1="musiclist/updata"
                this.list[i].likes=1;
                this.$http.post(url1,res).then(result=>{})
                var obj={ksong:this.list[i].lname,ksinger:this.list[i].l_singer}
                var url="musiclist/like";
                this.$http.post(url,obj).then(result=>{
                    Toast("喜欢"); 
                })
            },
            downlike(i){
                this.$store.commit("substract");
                var res={likes:0,lid:this.list[i].lid}
                var url1="musiclist/updata"
                 this.list[i].likes=0;
                this.$http.post(url1,res).then(result=>{})
               var url="musiclist/delete?ksong="+this.list[i].lname;
               this.$http.get(url).then(result=>{
                   Toast("取消"); 
                 })
            },                                                                      
            getmusic(){
                var url="musiclist/music";
                this.$http.get(url).then(result=>{
                this.list=result.body;
                })
            }
        },
        created(){
            this.getmusic();     
        },
    }
</script>
<style scoped>
    .mui-table-view{
        padding-top:5px;
    }
     .mui-table-view p{
        float:left;
     } 
    .singname{
        color:#000;
        line-height:32px;
    }
    .right{
        float:right;
        height:32px;
        width:32px;
    }
</style>
