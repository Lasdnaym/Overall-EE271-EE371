/* Module to help with stability */
module meta(on, clk, out);
	input logic on;
	input logic clk;
	output logic out;
	enum {on1, off1} ps, ns;
	always_comb begin
		case(ps)
			on1: if (on == 1) 
				ns = on1;
			else 
				ns = off1;
			off1: if (on == 1) 
				ns = on1;
			else 
				ns = off1;
		endcase
	end
	always_ff @(posedge clk) begin
		ps <= ns;
	end
	always_comb begin
		if (ps == on1) begin
			out = 1;
		end else begin
			out = 0;
		end
	end
endmodule
