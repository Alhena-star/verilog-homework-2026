## 第二次作业（HW02）：流水灯仿真

### 1. 使用方波激励、CD4017、LED，实现8个流水灯的仿真


### 2. 设计要求

- 必须使用课堂已经订正的 clk_gen.v cd4017.v led.v 模块文件。
- 必须通过实例化一个cd4017、八个led，实现流水灯，不要另写算法或模块。
- 注意大小写和缩进。

```bash
//led.v
module led(clk,out);
    input clk;
    output out;
    assign out = clk;
endmodule
```

```bash
//cd4017.v
module cd4017(clk,reset,inhibit,cout,q);
	input clk,reset,inhibit;
	output cout;
	output [9:0] q;
	reg [3:0] count;

	always@(posedge clk or posedge reset)
	begin
		if(reset)
			count<=0;
		else if(!inhibit)
		begin
			if(count==9)
				count<=0;
			else
				count<=count+1;
		end
	end
	assign q=10'b0000_0000_01<<count;
	assign cout=!(count<9);
endmodule
```

### 3. 提交文件和 PR

| 路径 | 说明 |
| --- | --- |
| `students/240201101/HW02/clk_gen.v` | 激励信号模块 |
| `students/240201101/HW02/cd4017.v` | 计数器模块 |
| `students/240201101/HW02/led.v` | led模块 |
| `students/240201101/HW02/top_tb.v` | 测试程序 |
| `students/240201101/HW02/report.png` | 波形图文件 |


在自己的学号分支上，通过 Pull Request 提交至教师仓库 `rosickey/verilog-homework-2026` 的 `main`。标题格式为：

```text
[240201101] HW02 - 王明
```

请替换为自己的学号和姓名。Git 具体操作[四、正常提交课程作业](https://github.com/rosickey/verilog-homework-2026#%E5%9B%9B%E6%AD%A3%E5%B8%B8%E6%8F%90%E4%BA%A4%E8%AF%BE%E7%A8%8B%E4%BD%9C%E4%B8%9A)