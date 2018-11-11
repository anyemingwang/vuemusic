<template>
<div class="box" >
  <div class="list-view" ref="listView">
    <ul style="list-style-type:none;">
      <li v-for="group in singers" class="list-group" :key="group.snum" ref="listGroup">
        <h2 class="list-group-title">{{group.title.stitle}}</h2>
        <ul>
          <li v-for="item in group.slist" class="list-group-item" :key="item.sid">
            <img :src="item.simg" class="avatar">
            <span class="name">{{item.singname}}</span>
          </li>
        </ul>
      </li>
    </ul>
    <div class="list-shortcut">
      <ul>
        <li v-for="(item, index) in shortcutList" class="item" :data-index="index" :key="item.snum" @touchstart="onShortcutStart" @touchmove.stop.prevent="onShortcutMove" :class="{'current': currentIndex === index}" style="list-style-type:none;">
          {{item}}
        </li>
      </ul>
    </div>
  </div>
</div>
</template>

<script>
import BScroll from 'better-scroll'

export default {
  data () {
    return {
      singers:[],
      scrollY: 0,
      currentIndex: 0
    }
  },
  created () {
    this.getsinger();
    this.touch = {}
    setTimeout(() => {
      this._initSrcoll()
      this._calculateHeight()
    }, 20)
  },
  methods: {
    getsinger(){
        var url="singer/singer";
            this.$http.get(url).then(result=>{
                this.singers=result.body;
          })
    },
    _initSrcoll () {
      this.scroll = new BScroll(this.$refs.listView, {
        probeType: 3,
        click: true
      })
      this.scroll.on('scroll', (pos) => {
        this.scrollY = pos.y
      })
    },
    onShortcutStart (e) {
      // 获取到绑定的 index
      let index = e.target.getAttribute('data-index')
      // 使用 better-scroll 的 scrollToElement 方法实现跳转
      this.scrollToElement(index)
      // 记录一下点击时候的 Y坐标 和 index
      let firstTouch = e.touches[0].pageY
      this.touch.y1 = firstTouch
      this.touch.anchorIndex = index
    },
    onShortcutMove (e) {
      // 再记录一下移动时候的 Y坐标，然后计算出移动了几个索引
      let touchMove = e.touches[0].pageY
      this.touch.y2 = touchMove
      // 这里的 16.7 是索引元素的高度
      let delta = Math.floor((this.touch.y2 - this.touch.y1) / 16.7)
      // 计算最后的位置
      // * 1 是因为 this.touch.anchorIndex 是字符串，用 * 1 偷懒的转化一下
      let index = this.touch.anchorIndex * 1 + delta
      this.scrollToElement(index)
    },
   scrollToElement (index) {
      // 处理边界情况
      // 因为 index 通过滑动距离计算出来的
      // 所以向上滑超过索引框框的时候就会 < 0，向上就会超过最大值
      if (index < 0) {
        return
      } else if (index > this.listHeight.length - 2) {
        index = this.listHeight.length - 2
      }
      //console.log(this.listHeight);
      // listHeight 是正的， 所以加个 -
      this.scrollY = -this.listHeight[index]
      this.scroll.scrollToElement(this.$refs.listGroup[index])
    },
    _calculateHeight () {
      this.listHeight = []
      const list = this.$refs.listGroup
      let height = 0
      this.listHeight.push(height);
      for (let i = 0;i < list.length;i++) {
        let item = list[i]
        height += item.clientHeight
        this.listHeight.push(height)
      }
    }
  },
  watch: {
    scrollY (newVal) {
      // 向下滑动的时候 newVal 是一个负数，所以当 newVal > 0 时，currentIndex 直接为 0
      if (newVal > 0) {
        this.currentIndex = 0
        return
      }
      // 计算 currentIndex 的值
      for (let i = 0; i < this.listHeight.length - 1; i++) {
        let height1 = this.listHeight[i]
        let height2 = this.listHeight[i + 1]
        if (-newVal >= height1 && -newVal < height2) {
          this.currentIndex = i
          return
        }
      }
      // 当超 -newVal > 最后一个高度的时候
      // 因为 this.listHeight 有头尾，所以需要 - 2
      this.currentIndex = this.listHeight.length - 2
    }
  },
  computed: {
    shortcutList () {
      return this.singers.map((group) => {
        return group.title.stitle;
       // console.log(group.title.stitle);
      })
    }
  }
}
</script>

<style lang="scss" scoped>
ul{
  -webkit-padding-start: 0px;
}
.box {
  position: fixed;
  width: 100%;
  height: 100%;
}
.list-view {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #EFEFF4;
  .list-group {
    padding-bottom: 10px;
    .list-group-title {
      height: 30px;
      line-height: 30px;
      padding-left: 20px;
      font-size: 12px;
      color: #000;
      background: #ddd;
    }
    .list-group-item {
      display: flex;
      align-items: center;
      padding: 10px 0 0 10px;
      .avatar {
        width:60px;
        height:60px;
        border-radius: 50%;
      }
      .name {
        margin-left: 20px;
        color: black;
        font-size: 14px;
      }
    }
  }
  .list-shortcut {
    position: absolute;
    z-index: 30;
    right: 0;
    top: 47%;
    transform: translateY(-50%);
    width: 20px;
    border-radius: 10px;
    text-align: center;
    background: rgba(167, 167, 167, 0.5);
    font-family:Helvetica;
    .item {
      padding: 2.5px;
      line-height: 1;
      color: black;
      font-size: 12px;
      &.current {
        color: #C20C0C;
      }
    }
  }
}
</style>

