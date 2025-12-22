<template>
  <div>
    <div class="card" style="padding: 15px">
      您好，{{ user?.name }}！欢迎使用本系统
    </div>

    <div style="display: flex; grid-gap: 10px; margin: 10px 0">
      <div style="width: 50%" class="card">
        <div style="margin-bottom: 20px">
          <el-select style="width: 150px" v-model="days" @change="loadLine">
            <el-option :value="7" label="近一周"></el-option>
            <el-option :value="14" label="近2周"></el-option>
            <el-option :value="30" label="近一个月"></el-option>
          </el-select>
        </div>
        <div style="width: 100%; height: 400px" id="line"></div>
      </div>

      <div style="width: 50%;" class="card">
        <div style="margin-bottom: 30px; font-size: 20px; font-weight: bold">公告列表</div>
        <div >
          <el-timeline  reverse slot="reference">
            <el-timeline-item v-for="item in notices" :key="item.id" :timestamp="item.time">
              <el-popover
                  placement="right"
                  width="200"
                  trigger="hover"
                  :content="item.content">
                <span slot="reference">{{ item.title }}</span>
              </el-popover>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </div>

    <!-- 添加文件类型统计柱状图 -->
    <div class="card" style="margin-top: 10px">
      <div style="margin-bottom: 20px">
        <el-select style="width: 150px" v-model="barDays" @change="loadBarChart">
          <el-option :value="7" label="近一周"></el-option>
          <el-option :value="14" label="近2周"></el-option>
          <el-option :value="30" label="近一个月"></el-option>
        </el-select>
      </div>
      <div style="width: 100%; height: 400px" id="barChart"></div>
    </div>
  </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name: "Home",
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      notices: [],
      days: 7,
      barDays: 7, // 添加柱状图的时间范围控制
      lineChart: null,
      barChart: null
    }
  },
  mounted() {
    this.loadLine();
    this.loadNotice();
    this.loadBarChart(); // 初始化加载柱状图
  },
  methods: {
    loadLine() {
      this.$request.get('/diskFiles/count?days=' + this.days).then(res => {
        if (res.code === '200') {
          let lines = res.data.map(item => item.count);
          let xAxis = res.data.map(item => item.date);

          let option = {
            title: {
              text: '文件上传趋势图'
            },
            tooltip: {
              trigger: 'axis'
            },
            legend: {
              data: ['文件数量']
            },
            xAxis: {
              type: 'category',
              data: xAxis
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                name: '文件数量',
                type: 'line',
                data: lines
              }
            ]
          };

          // 销毁之前的实例以防内存泄漏
          if (this.lineChart) {
            this.lineChart.dispose();
          }

          this.lineChart = echarts.init(document.getElementById('line'));
          this.lineChart.setOption(option);
        } else {
          console.error('获取文件上传趋势数据失败:', res.msg);
          this.$message.error('获取文件上传趋势数据失败: ' + res.msg);
        }
      }).catch(error => {
        console.error('加载文件上传趋势图失败:', error);
        this.$message.error('加载文件上传趋势图失败');
      });
    },

    loadBarChart() {
      this.$request.get('/diskFiles/selectFileTypeBar/' + this.barDays).then(res => {
        if (res.code === '200') {
          const data = res.data;

          // 准备图表数据
          const types = Object.keys(data);
          if (types.length === 0) {
            // 如果没有数据，显示空状态
            let option = {
              title: {
                text: '每日文件类型统计',
                subtext: '暂无数据'
              }
            };
            
            if (this.barChart) {
              this.barChart.dispose();
            }
            
            this.barChart = echarts.init(document.getElementById('barChart'));
            this.barChart.setOption(option);
            return;
          }

          // 构造每个日期的数据
          const dates = [...new Set(types.flatMap(type => Object.keys(data[type])))];

          const series = types.map(type => {
            return {
              name: type,
              type: 'bar',
              stack: '总量',
              data: dates.map(date => data[type][date] || 0)
            };
          });

          let option = {
            title: {
              text: '每日文件类型统计'
            },
            tooltip: {
              trigger: 'axis',
              axisPointer: {
                type: 'shadow'
              }
            },
            legend: {
              data: types
            },
            xAxis: {
              type: 'category',
              data: dates
            },
            yAxis: {
              type: 'value'
            },
            series: series
          };

          // 销毁之前的实例以防内存泄漏
          if (this.barChart) {
            this.barChart.dispose();
          }

          this.barChart = echarts.init(document.getElementById('barChart'));
          this.barChart.setOption(option);
        } else {
          console.error('获取文件类型统计数据失败:', res.msg);
          this.$message.error('获取文件类型统计数据失败: ' + res.msg);
        }
      }).catch(error => {
        console.error('加载文件类型统计图失败:', error);
        this.$message.error('加载文件类型统计图失败');
      });
    },

    loadNotice() {
      this.$request.get('/notice/selectAll').then(res => {
        this.notices = res.data || [];
      }).catch(error => {
        console.error('加载公告失败:', error);
        this.$message.error('加载公告失败');
      });
    }
  }
}
</script>