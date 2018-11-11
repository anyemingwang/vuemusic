<template>
    <div class="app">
         <div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable mui-scalable" style="height:580px;">
			<aside id="offCanvasSide" class="mui-off-canvas-right">
				<div id="offCanvasSideScroll" class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<div class="title11" style=" ">个人中心</div>
                        <div id="loname" v-if="$store.getters.baiCount=='true'">
                            <span class="loname">欢迎:{{$store.state.uname}}</span>
                            <button type="button" class="mui-btn mui-btn-danger" style="padding: 5px 20px;" @click="quit">退出</button>
                        </div>
                        <div style="padding:0 0 0 20px;" v-else >
                            <button type="button" class="mui-btn mui-btn-primary" style="padding: 5px 20px;" @click="login">登录</button>
                            <button type="button" class="mui-btn mui-btn-danger" style="padding: 5px 20px;" @click="register">注册</button>  
                        </div>
						<ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted">
							<li class="mui-table-view-cell">
                            <span class="mui-icon mui-icon-email-filled"></span>&nbsp;
									消息中心   
							</li>
							<li class="mui-table-view-cell">
                            <span class="mui-icon-extra mui-icon-extra-peoples"></span>&nbsp;
									我的好友
							</li>
							<li class="mui-table-view-cell">
							<span class="mui-icon-extra mui-icon-extra-gift"></span>&nbsp;
									会员中心
							</li>
							<li class="mui-table-view-cell">
								<span class="mui-icon-extra mui-icon-extra-outline"></span>&nbsp;
									定时关闭
							</li>
							<li class="mui-table-view-cell">
							<span class="mui-icon mui-icon-settings"></span>&nbsp;
									蝰蛇音效
							</li>
							<li class="mui-table-view-cell">
							<span class="mui-icon mui-icon-mic"></span>&nbsp;	
							    听歌识曲
							</li>
						</ul>
					</div>
				</div>
			</aside>
			<div class="mui-inner-wrap">
				<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper" style="height:100%;">
                <div class="img">
				<mt-swipe :auto="4000">
                    <mt-swipe-item v-for="item in list" :key="item.id">
                        <img :src="item.img_url">
                    </mt-swipe-item>   
                    </mt-swipe>
		</div>
    <!--六宫格-->
        <ul class="mui-table-view mui-grid-view mui-grid-9">
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
            <router-link to="index/music">
                <img src="../../common/img/index/radio_1.jpg">
                <div class="mui-media-body">乐库</div>
            </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
            <router-link to="home/goodlist">
                <img src="../../common/img/index/radio_2.jpg">
                <div class="mui-media-body">电台</div>
            </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                <img src="../../common/img/index/radio_3.jpg">
                <div class="mui-media-body">下载</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                <img src="../../common/img/index/radio_4.jpg">
                <div class="mui-media-body">最近</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                <img src="../../common/img/index/radio_5.jpg">
                <div class="mui-media-body">酷群</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                <img src="../../common/img/index/radio_6.jpg"> 
                <div class="mui-media-body">更多</div></a></li>
        </ul>
				<div class="mui-card-header">工具</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                    <ul class="subNav">
                        <li>
                        <span class="mui-icon-extra mui-icon-extra-grech"></span><br>
                        <span class="mui-tab-label">游戏</span>
                        </li>
                        <li>
                        <span class="mui-icon-extra mui-icon-extra-notice"></span><br>
                        <span class="mui-tab-label">铃声</span></li>
                        <li>
                        <span class="mui-icon-extra mui-icon-extra-cart"></span><br>
                        <span class="mui-tab-label">商城</span></li>
                        <li>
                        <span class="mui-icon mui-icon-pengyouquan"></span><br>
                        <span class="mui-tab-label">分享</span></li>
                        <li>
                        <span class="mui-icon mui-icon-gear"></span><br>
                        <span class="mui-tab-label">设置</span></li>
                    </ul>
					</div>
				</div>
				</div>
				<!-- off-canvas backdrop -->
				<div class="mui-off-canvas-backdrop"></div>
			</div>
		</div>
		
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        data(){
            return {
                list:[]          
            }
        },
        methods:{
            getImageList(){
                //获取图片轮播数据
                var url="imagelist/list"
                this.$http.get(url).then(result=>{
                    if(result.body.code==1){
                        this.list=result.body.msg;
                    }else{
                        Toast("加载轮播图片失败..");
                    }
                })
            },
            quit(){
                this.$store.commit("login_out");        
            },
            login(){
                this.$router.push({path:'/index/login'});
            },
            register(){
                this.$router.push({path:'/index/register'});
            }
        },
        created(){
            this.getImageList();
        },
    }
</script>
<style scoped>
    #loname{
        display:flex;
        justify-content:space-between;
        padding:0 0 0 20px;
        line-height:30px;
    }
    #loname button{
        margin-right:20px;
    }
    .loname{
        font-size:20px;
        color:#fff;
        display:inline-block;
    }
   .title11{
        font-size:20px;
        margin: 25px;
        color:#fff;
    }
    .app .mui-grid-view.mui-grid-9{
         background-color: #fff;
         margin-top:5px;
    }
    .app .mui-grid-view.mui-grid-9 .mui-table-view-cell{
         border:0;
    }
    .app img{
        width:50px;
    }
    .app .mint-swipe{
        height:180px;
    }
    .app .mint-swipe img{
        width:100%;
        height:180px;
    }
    .mui-table-view{
        margin-top:10px;
    }
   .mui-card-header,.img{
    margin-top:5px;
}
.mui-card-header,.mui-card-content{
    background:#fff;
}
.mui-card-content{
    height:60px;
    position:relative;
}
.subNav{
    position:absolute;
    top:-7px;
    left:0;
    list-style:none;
    text-decoration:none;
}
.subNav li{
    float:left;
    width:65px;
}

</style>