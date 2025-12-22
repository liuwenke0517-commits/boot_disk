<template>
  <div class="home-container">
    <div class="left">
      <div style="padding: 10px 0">
        <el-button type="primary" @click="addFolder">新建文件夹</el-button>
        <el-upload
            :action="uploadUrl"
            :headers="{token: user.token}"
            :on-success="handleUploadSuccess"
            :show-file-list="false"
            style="display: inline-block; margin-left: 10px"
        >
          <el-button type="success">上传文件</el-button>
        </el-upload>
      </div>

      <div class="category" :class="{'category-active': !category}" @click="loadFiles('all')">
        <i class="el-icon-files" style="margin-right: 10px"></i>全部文件
      </div>
      <div class="category" :class="{'category-active': category === 'img'}" @click="loadFiles('img')">
        <i class="el-icon-picture-outline" style="margin-right: 10px"></i>图片
      </div>
      <div class="category" :class="{'category-active': category === 'video'}" @click="loadFiles('video')">
        <i class="el-icon-video-play" style="margin-right: 10px"></i>视频
      </div>
      <div class="category" :class="{'category-active': category === 'zip'}" @click="loadFiles('zip')">
        <i class="el-icon-box" style="margin-right: 10px"></i>压缩包
      </div>
      <div class="category" @click="$router.push('/front/favorite')">
        <i class="el-icon-star-off" style="margin-right: 10px"></i>我的收藏
      </div>
      <div class="category" @click="$router.push('/front/share')">
        <i class="el-icon-share" style="margin-right: 10px"></i>我的分享
      </div>
      <div class="category" @click="$router.push('/front/trash')">
        <i class="el-icon-delete" style="margin-right: 10px"></i>回收站
      </div>
    </div>

    <div class="right">
      <Main :typeList="typeList" ref="main"/>
    </div>
  </div>
</template>

<script>
import Main from "@/components/Main";

export default {
  components: {
    Main
  },
  data() {
    return {
      categoryList: [
        {"text": '全部文件', category: 'all', icon: ''},
        {"text": '图片', category: 'img', icon: 'el-icon-picture-outline'},
        {"text": '视频', category: 'video', icon: 'el-icon-video-play'},
        {"text": '压缩', category: 'zip', icon: 'el-icon-box'}
      ],
      typeList: [
        { text: 'mp3', icon: 'el-icon-mp3' },
        { text: 'mp4', icon: 'el-icon-mp4' },
        { text: 'jpg', icon: 'el-icon-jpg' },
        { text: 'jpeg', icon: 'el-icon-jpeg' },
        { text: 'png', icon: 'el-icon-png' },
        { text: 'pdf', icon: 'el-icon-pdf' },
        { text: 'docx', icon: 'el-icon-docx' },
        { text: 'txt', icon: 'el-icon-text' },
        { text: 'zip', icon: 'el-icon-zip' },
        { text: 'folder', icon: 'el-icon-folder' },
      ],
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      category: this.$route.query.category || null,  // 分类
    }
  },
  mounted() {

  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    addFolder() {
      this.$refs.main.addFolder()
    },
    handleUploadSuccess(response, file, fileList) {
      if (response.code === '200') {
        this.$message.success('上传成功')
        this.$refs.main.load()
      } else {
        this.$message.error(response.msg)
      }
    },
    loadFiles(category) {
      location.href = '/front/home?category=' + category
    }
  }
}
</script>

<style scoped>
.category {
  cursor: pointer;
}
.category:hover {
  background-color: #f8f8f8;
  color: #000;
}
.category-active {
  color: #409EFF;
}
</style>