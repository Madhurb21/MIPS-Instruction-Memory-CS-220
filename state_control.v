`timescale 1ns / 1ps

`include "state_defs.v"

`define MAX_PC 11

module state_control(clk, program_counter, state
    );

   	input clk;
   	input [7:0] program_counter;
	output [2:0] state;
	
	reg [2:0] state;
	
	initial begin
	   	state = `STATE_IF;
	end
	
	always @ (posedge clk) begin
	   	if ((state == `STATE_WB) && (program_counter < `MAX_PC)) begin
         		state <= `STATE_IF;
		end
		else if (state != `STATE_OUTPUT) begin
		   	state <= state + 1;
		end
	end

endmodule
