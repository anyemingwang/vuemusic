import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import HomeContainer from "@/components/MyTab/HomeContainer"
import ListContainer from "@/components/MyTab/ListContainer"
import SingerContainer from "@/components/MyTab/SingerContainer"
import LikeContainer from "@/components/MyTab/LikeContainer"
import MyList from "@/components/base/MyList"
import MyLogin from "@/components/MyLogin/MyLogin"
import MyRegister from "@/components/MyLogin/MyRegister"
import Mymusic from "@/components/MyMusicList/Mymusic"
Vue.use(Router)

export default new Router({
  //mode: 'history',
  routes: [
    {path:'/',redirect:"/index"},
    {path: '/index',component:HomeContainer},
    {path: '/list',component:ListContainer},
    {path: '/musiclist/:id',component:MyList},
    {path: '/index/login',component:MyLogin},
    {path: '/index/register',component:MyRegister},
    {path: '/index/music',component:Mymusic},
    {path: '/singer',component:SingerContainer},
    {path: '/like',component:LikeContainer},
  ],linkActiveClass:"mui-active"
})
