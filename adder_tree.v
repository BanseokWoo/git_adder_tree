module adder_tree(A,B,C,D,E,F,G,H,CLK,OUT);
    parameter WIDTH = 16;
   
	input [WIDTH-1:0] A,B,C,D,E,F,G,H;
	input 			  CLK;
	output [WIDTH-1:0] OUT;

    wire [WIDTH-1:0]    sum1_1, sum1_2, sum1_3, sum1_4, sum2_1, sum2_2, sum3_1;


    assign 			  sum1_1 = A + B;
	assign 			  sum1_2 = C + D;
	assign 			  sum1_3 = E + F;
	assign 			  sum1_4 = G + H;		  		

    assign            sum2_1 = sum1_1 + sum1_2;
    assign            sum2_2 = sum1_3 + sum1_4;

    assign            sum3_1 = sum2_1 + sum2_2;

	assign 			  OUT = sum3_1;

    always @ (posedge CLK)
		begin
          #1
          $display("         A: %0d, sum1_1: %0d, sum2_1: %0d, sum3_1: %0d, OUT: %0d", A, sum1_1, sum2_1, sum3_1, OUT);
          $display("         B: %0d                                                 ", B);
          $display("         C: %0d, sum1_2: %0d                                    ", C, sum1_2);
          $display("         D: %0d                                                 ", D);

          $display("         E: %0d, sum1_3: %0d, sum2_2: %0d                       ", E, sum1_3, sum2_2);
          $display("         F: %0d                                                 ", F);
          $display("         G: %0d, sum1_4: %0d                                    ", G, sum1_4);
          $display("         H: %0d                                                 ", H);

		end
    
endmodule