<template>
    <div class="app_like">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media" v-for="(item,i) in list">
			<p class="singname">{{i+1}}.{{item.ksong}} - {{item.ksinger}}</p>
            </li>
        </ul>
    </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[],
            }
        },
        methods:{
            getlike(){
                var url="musiclist/likelist";
                this.$http.get(url).then(result=>{
                this.list=result.body;
                })
            }   
        },
        created(){
            this.getlike();    
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