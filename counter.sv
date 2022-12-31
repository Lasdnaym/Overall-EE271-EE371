module counter(incr, decr, clk, count, reset);
	input logic incr, decr, reset;
	input logic clk;
	output int count;

	enum {zero, one, two, three, four, five} ps, ns;

	always_comb begin
		case(ps)
			zero:	if(incr == 1) 
				ns = one;
			else 				
				ns = zero;
			one: if(incr == 1) 	
				ns = two;
			else if(decr == 1) 
				ns = zero;
			else 						
				ns = one;
			two: if(incr == 1)	
				ns = three;
			else if (decr == 1) 	
				ns = one;
			else						
				ns = two;
			three: if(incr == 1) 
				ns = four;
			else if(decr == 1) 
				ns = two;
			else						
				ns = three;
			four:	if(incr == 1) 
				ns = five;
			else if(decr == 1) 
				ns = three;
			else						
				ns = four;
			five:	if (decr == 1) 
				ns = four;
			else 
				ns = five;
		endcase
	end

	always_ff @(posedge clk) begin
		if (reset) begin
			ps <= zero;
		end else begin
			ps <= ns;
		end
	end

	always_comb begin
		if(ps == zero) begin
			count = 0;
		end else if (ps == one) begin
			count = 1;
		end else if (ps == two) begin
			count = 2;
		end else if (ps == three) begin
			count = 3;
		end else if (ps == four) begin
			count = 4;
		end else begin
			count = 5;
		end
	end
endmodule 
