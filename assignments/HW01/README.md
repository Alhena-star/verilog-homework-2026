## 第一次作业（HW01）：CD4017仿真

### 1. 使用方波激励、实现十进制计数器CD4017的仿真


### 2. 设计要求

- 必须使用课堂已经订正的 clk_gen.v 模块文件进行测试。
- CD4017设置有一个使能端 en，一个清零端 clr,输出q[9:0]。
- 注意大小写和缩进。

### 3. 提交文件和 PR

| 路径 | 说明 |
| --- | --- |
| `students/240201101/HW01/clk_gen.v` | 激励信号模块 |
| `students/240201101/HW01/cd4017.v` | CD4017模块 |
| `students/240201101/HW01/top_tb.v` | 测试程序，必须实例化clk_gen和cd4017|
| `students/240201101/HW01/report.png` | 波形图文件 |


在自己的学号分支上，通过 Pull Request 提交至教师仓库 `rosickey/verilog-homework-2026` 的 `main`。标题格式为：

```text
[240201101] HW01 - 王小明
```

请替换为自己的学号和姓名。Git 具体操作[四、正常提交课程作业](https://github.com/rosickey/verilog-homework-2026#%E5%9B%9B%E6%AD%A3%E5%B8%B8%E6%8F%90%E4%BA%A4%E8%AF%BE%E7%A8%8B%E4%BD%9C%E4%B8%9A)