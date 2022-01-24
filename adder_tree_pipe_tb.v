// Testbench
module test;
  
  parameter WIDTH = 16;
  var [WIDTH-1:0] i = 1;
  var [WIDTH-1:0] t = 0;


  reg [WIDTH-1:0]A,B,C,D,E,F,G,H;
  reg CLK;
  wire [WIDTH-1:0]OUT;
  
  adder_tree UUT(A,B,C,D,E,F,G,H,CLK,OUT);

  always 
    begin
        $display("Clock ticks and setting A~H to %0d", i);
        A = i;B = i;C = i;D = i;E = i;F = i;G = i;H = i;

        CLK = 1'b1; 
        #20;
        CLK = 1'b0;
        #20;
        
        i *= 2; // changing i
        if (i > 2000) begin
            i = 1; //resetting i
        end

        t += 1;
        display;

        $system("sleep 0.3"); //sleep to see clearly

    end
  
          
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  task display;
    $display("OUT from outside: %0d, now clock is: %0d", OUT, t);
    $display(" ");
    $display(" ");
    $display(" ");
  endtask
endmodule