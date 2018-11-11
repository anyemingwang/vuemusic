<template>
 <div class="app-container">
     <!--顶部导航 -->
     <header class="mui-bar mui-bar-nav">
            <img src="./common/img/icons/logo.png" class="image">
            <a id="offCanvasBtn" href="#offCanvasSide" class="mui-icon  mui-pull-right mycenter">
             <img src="./common/img/icons/mycenter.png"></img>
            </a>
	</header>
     <!--路由器显示其他模块 -->
    <router-view></router-view>
     <!-- mui tabbar-->
    <nav class="mui-bar mui-bar-tab">
        <router-link class="mui-tab-item" to="/index">
            <span class="mui-icon mui-icon-home"></span>
            <span class="mui-tab-label" >首页</span>
        </router-link>
        <router-link class="mui-tab-item" to="/list">
            <span class="mui-icon mui-icon-bars"></span>
            <span class="mui-tab-label">榜单</span>
        </router-link>
        <router-link class="mui-tab-item" to="/singer">
            <span class="mui-icon mui-icon-star-filled"></span>
            <span class="mui-tab-label">歌手</span>
        </router-link>
        <router-link class="mui-tab-item" to="/like">
            <span class="mui-icon mui-icon-extra mui-icon-extra-heart-filled"><span class="mui-badge">{{$store.getters.optCount}}</span></span>
            <span class="mui-tab-label">我喜欢</span>
        </router-link>
    </nav>
	</div>
 </div>
</template>
<script>
    export default {
        onLaunch: function () {
            console.log('App Launch');
        },
        onShow: function () {
            console.log('App Show');
        },
        onHide: function () {
            console.log('App Hide');
        },
    }
</script>
<style scoped>
  * { touch-action: pan-y; } 
    .mui-action-back{
        color:#fff;
        font-size:18px;
        margin-right:10px;
    }
    .image{
        width:130px;
        height:30px;
        margin:7px 0 0 100px;
    }
    .mycenter,.mycenter img{
        width:18px;
        height:23px;
        float:right;
    }
   .app-container{
     padding-top:40px;
     padding-bottom:50px;
     overflow-x:hidden;
   }
 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}
 page {
        min-height: 100%;
        display: flex;
    }
    .content {
        display: flex;
        flex: 1;
        flex-direction: column;
        background-color: #efeff4;
        padding: 20px;
    }
    .btn-row {
        margin-top: 50px;
        padding: 20px;
    }
    button.primary {
        background-color: #0faeff;
    }
</style>
