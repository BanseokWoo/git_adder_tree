module adder_tree(A,B,C,D,E,F,G,H,CLK,OUT);
    parameter WIDTH = 16;
   
	input [WIDTH-1:0] A,B,C,D,E,F,G,H;
	input 			  CLK;
	output [WIDTH-1:0] OUT;

    wire [WIDTH-1:0]    sum1_1, sum1_2, sum1_3, sum1_4, sum2_1, sum2_2, sum3_1;

    reg [WIDTH-1:0]    sumreg1_1, sumreg1_2, sumreg1_3, sumreg1_4, sumreg2_1, sumreg2_2, sumreg3_1;

	always @ (posedge CLK)
		begin
			sumreg1_1 <= sum1_1;
			sumreg1_2 <= sum1_2;
			sumreg1_3 <= sum1_3;
			sumreg1_4 <= sum1_4;

			sumreg2_1 <= sum2_1;
			sumreg2_2 <= sum2_2;
            
			sumreg3_1 <= sum3_1;
            #1
          $display("         A: %0d, sum1_1: %0d, sumreg1_1: %0d, sum2_1: %0d, sumreg2_1: %0d, sum3_1: %0d, sumreg3_1: %0d, OUT: %0d", A, sum1_1, sumreg1_1, sum2_1, sumreg2_1, sum3_1, sumreg3_1, OUT);
          $display("         B: %0d                                                                                                ", B);
          $display("         C: %0d, sum1_2: %0d, sumreg1_2: %0d                                                                   ", C, sum1_2, sumreg1_2);
          $display("         D: %0d                                                                                                ", D);

          $display("         E: %0d, sum1_3: %0d, sumreg1_3: %0d, sum2_2: %0d, sumreg2_2: %0d                                      ", E, sum1_3, sumreg1_3, sum2_2, sumreg2_2);
          $display("         F: %0d                                                                                                ", F);
          $display("         G: %0d, sum1_4: %0d, sumreg1_4: %0d                                                                   ", G, sum1_4, sumreg1_4);
          $display("         H: %0d                                                                                                ", H);





		end

    assign 			  sum1_1 = A + B;
	assign 			  sum1_2 = C + D;
	assign 			  sum1_3 = E + F;
	assign 			  sum1_4 = G + H;		  		

    assign            sum2_1 = sumreg1_1 + sumreg1_2;
    assign            sum2_2 = sumreg1_3 + sumreg1_4;

    assign            sum3_1 = sumreg2_1 + sumreg2_2;
    
	assign 			  OUT = sumreg3_1;
endmodule