<template>
    <div class="app_list">
                <div class="imgtop">
                <router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left back" to="/list" style="color:#fff;"></router-link >
                    <img :src="list[0].image" >  
                </div>
				<div class="mui-slider-item mui-control-content mui-active">
							<div class="pc_songlist">
								<ul class="mui-table-view">
								<li class="mui-table-view-cell" v-for="(item,i) in list">
                                <span class="pc_btn" data-check=checkbox></span>
                                <span class="pc_num">{{++i}}</span>
                                <a href="#" class="pc_songname">{{item.l_singer}} - {{item.lname}}</a>
                                <span class="pc_songTips"></span>
                                <span class="pc_songTime">{{item.ltime}}</span>
                                <span class="pc_share"></span>
                                <span class="pc_download"></span>
                                <span class="icon-play"></span>
                                </li>
								</ul>
                                <br>
                                <mt-button type="primary" size="large" @click="gethot">加载更多</mt-button>
				</div>   
			</div>
            </div>
    </div>
</template>
<script scoped>
import {Toast} from "mint-ui";
    export default{
        data(){
            return {
                list:[],
                pageIndex:0,
                lid:this.$route.params.id,
            }
        },
        methods:{
            gethot(){
                this.pageIndex++;
                    var url="rank/hot?pno="+this.pageIndex+"&lid="+this.lid;
                    this.$http.get(url).then(result=>{
                        if(result.body.code==1){
                        this.list=this.list.concat(result.body.msg.data);
                        Toast("获取成功");
                     }else{
                        Toast("获取失败");
                    } 
                })
            },
        },
        created(){
            this.gethot();     
        },
    }
</script>
<style scoped>
    /*.mui-scroll::-webkit-scrollbar {
        display:none
    }*/
    .imgtop img{
        width:100%;
        height:235px;
        position:relative;
        z-index:1;
    }
    .back{
        position:absolute;
        top:50px;
        left:10px;
        z-index:100;
    }
   .pc_btn{
    display:inline-block;
    width: 16px;
    height: 16px;
    float: left;
    margin:10px 10px 0 0;
    background: url("../../common/img/icons/icon_splice.png") no-repeat -180px -178px;
}
.pc_btn.checkbox{
    background-position: -180px -148px;
}
.pc_songhead .pc_btn{
    margin-top:6px;
}
.pc_songhead>span{
    color: #999;
    font-size:14px;
    float: left;
    display:inline-block;
    padding:6px 0 0 3px;
}
.pc_songlist ul>li{
    width: 375px;
    height: 54px;
    line-height: 54px;
    display: block;
    border-bottom:1px solid #F2F2F2;
}
.pc_songlist ul>li:hover{
    background-color:#F5F8FB;
}
.pc_songlist ul li>.pc_btn,.pc_num,.pc_songTips,.pc_songname{
    float:left;
    display: inline-block;
}
.pc_num,.pc_songTips,.pc_songname{
    margin-right: 10px;
}
.pc_songname{
   height:37px;
   line-height:37px;
}
.pc_songTime,.pc_share,.pc_download,.icon-play{
    float:right;
    display: inline-block;
}
.pc_songTime{
    height:37px;
    line-height:37px;
}
.pc_share,.pc_download,.icon-play{ 
    width: 20px;
    height: 20px;
    margin:8px 8px 0 0;
    background: url("../../common/img/icons/icon_splice.png") no-repeat;
    display:none;
    
}
.pc_num{
    width: 15px;
    line-height:36px;
    color:#999999;
    font-size:16px;
    margin-bottom:5px;
}
.pc_songlist ul li:nth-child(1)>.pc_num,.pc_songlist ul li:nth-child(2)>.pc_num,.pc_songlist ul li:nth-child(3)>.pc_num{
    color: #FE2C62;
    font-size: 19px;
}
.pc_songTips{
    width: 23px;
    height: 20px;
    margin:8px 0 0 5px;
    background: url("../../common/img/icons/icon_splice.png") no-repeat  -238px -235px;
    display:block;
}
.pc_songname{
    color: #333;
    font-size:14px;
}
.pc_songlist ul li:hover .pc_songTime,.pc_songlist ul li:hover .pc_songname{
    color:#00A6F5;
}
.pc_share{
    background-position:-298px 2px; 
}
.pc_share:hover{
    background-position:-298px -58px;
}
.pc_download{
    background-position: -87px 2px;
}
.pc_download:hover{
    background-position: -87px -58px;
}
.icon-play{
    background-position: 5px 2px;
}
.icon-play:hover{
     background-position: 5px -58px;
}

.pc_songTime{
    color:#999;
}
.pc_songlist ul li:hover .pc_songTips{
    display:none;
}
.pc_songlist ul li:hover .icon-play,.pc_songlist ul li:hover .pc_download,.pc_songlist ul li:hover .pc_share{
    display: block;
}
</style>