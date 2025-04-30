// File: up_counter.v
// Function: 4-bit Up Counter with synchronous reset and enable
 
module up_counter #(
	parameter WIDTH = 4
)(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [WIDTH-1:0] count
	
);

always @(posedge clk) begin
		if (rst)
			count <= 0;
		else if (enable)
			count <= count + 1;
end
endmodule
		