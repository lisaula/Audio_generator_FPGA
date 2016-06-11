`timescale 1ns / 1ps
module Main(
	input clk50Mghz,
	input c,
	input d,
	input e,
	input g,
	output [3:0] data
    );
	 
	 reg[4:0] address;
	 wire clk_c;
	 wire clk_d;
	 wire clk_e;
	 wire clk_g;
	 wire clk_s;
	 reg temp;
	 assign clk_s = temp;
	 reg [11:0]divider;
	CLK_Divider #(.counter_limit(12'hbaa))clk(.clk(clk50Mghz),.clk1hz(clk_c));
	CLK_Divider #(.counter_limit(12'ha64))clk2(.clk(clk50Mghz),.clk1hz(clk_d));
	CLK_Divider #(.counter_limit(12'h941))clk3(.clk(clk50Mghz),.clk1hz(clk_e));
	CLK_Divider #(.counter_limit(12'h7c9))clk4(.clk(clk50Mghz),.clk1hz(clk_g));
	
	SineWave rom(address,data);
	
	always @(posedge clk_s)
	begin
		address = address+1;
	end
		
	always @(c or d or e or g)
	begin
		if(c)
		begin
			temp = clk_c;
		end
		else if(d)
		begin
			temp = clk_d;
		end
		else if(e)
		begin
			temp = clk_e;
		end
		else if(g)
		begin
			temp = clk_g;
		end
		else
		begin
			temp = 0;
		end	
	end


endmodule
