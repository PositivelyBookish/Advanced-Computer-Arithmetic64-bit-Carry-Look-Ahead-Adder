module testbench_cla_64_bit();

  reg [63:0] A, B;
  reg Cin;
  wire [63:0] S;
  wire [63:0] Carry;
  wire Cout;

  // Instantiate the CLA 64-bit adder
  cla_64_bit uut(A,B,Cin,S,Carry,Cout);

  // Clock generation
  reg clk = 0;
   always
     begin
    	#700 clk = ~clk;
  	 end


  initial 
    begin
      $dumpfile("wavedump.vcd");
      $dumpvars();
      $monitor("Time=%0t A=%b B=%b Cin=%b S=%b Carry=%b Cout=%b", $time, A, B, Cin, S, Carry, Cout);
      A = 64'b0000000000000000000000000000000000000000000000000000000000000000;
      B = 64'b1111111111111111111111111111111111111111111111111111111111111111;
      Cin = 1'b0;
      #500
      Cin = 1'b1;
      #1000
      A = 64'b0000000000000000000000000000000000000000000000000000000000000000;
      B = 64'b1111111111111111111111111111111111111111111111111111111111111111;
      Cin = 1'b0;
      #500
      A = 64'b0000000000000000000000000000000000000000000000000000000000000001;

      #1000
      $finish;
    end

endmodule