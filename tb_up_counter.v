`timescale 1ns/1ps
module tb_up_counter;
	//參數
	parameter WIDTH = 4;
	
	//測試用變數(inut/output)
	reg clk;
	reg rst;
	reg enable;
	wire [WIDTH-1:0] count;
	
	//實例化待測模組
	up_counter #(WIDTH) UUT(
		 .clk(clk),
		 .rst(rst),
		 .enable(enable),
		 .count(count)
	);
	
	//產生時脈 (10ns period, 50MHz)
	always #5 clk = ~clk;
	
	initial begin
		//初始值
		clk = 0;
		rst = 1;
		enable = 0;
		
		//reset期間
		#10
	   rst = 0; //釋放reset
		enable = 1; //開始計數
		
		#40
		enable = 0; //暫停計數
		
		#20
		enable = 1; //再次開始計數
		
		#50;
		$stop; //模擬暫停
	end
endmodule