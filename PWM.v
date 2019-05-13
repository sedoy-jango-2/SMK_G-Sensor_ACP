module PWM_Geneator(
	clk,
	total_dur,
	high_dur,
	PWM
);


input 					clk;
input       [31:0]   high_dur;
input			[31:0]   total_dur;

output	reg			PWM;
reg	      [31:0]	tick;

always @ (posedge clk)
begin
if (tick >= total_dur)
	begin
		tick <= 0;
	end
	else
		tick <= tick + 1;
end


always @ (posedge clk)
begin
		PWM <= (tick < high_dur)?1'b1:1'b0;//duck die width(5us)250  
end


endmodule
