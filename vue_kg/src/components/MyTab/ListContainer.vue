<template>
    <div class="app_list">
       <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media" v-for="res in list" :key="res.img.yid">
        <router-link :to="'/musiclist/'+res.img.yid">
            <img class="mui-media-object mui-pull-left" :src="res.img.image">
            <div class="mui-media-body">
                <p class='mui-ellipsis' v-for="(item,i) in res.slist">{{i+1}}&nbsp;&nbsp;{{item.lname}} - {{item.l_singer}}</p>
            </div>
        </router-link>
        </li>
    </ul>
    </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[],
                no:5
            }
        },
        methods:{
            getimage(){
                var url="imagelist/demo?no="+this.no;
                this.$http.get(url).then(result=>{
                        this.list=result.body; 
                })
            }
        },
        created(){
            this.getimage(); 
        },
    }
</script>
<style scoped>
    .mui-table-view{
        background:transparent;
        
    }
   .mui-table-view-cell{
       height:100px;
       width:340px;
       margin:15px;
       background:#fff;
       padding:5px 6px;
       border-radius:5px;
   }
   .mui-table-view .mui-media-object{
       width:100px;
       height:100px;
       max-width: 100px;
   }
   .mui-table-view-cell p{
       margin:10px;
       color:#666;
   }
</style>

