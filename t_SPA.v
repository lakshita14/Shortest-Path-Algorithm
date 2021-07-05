`timescale 1ns / 1ps
// Code your testbench here
// or browse Examples
module t_SPA;
   reg  in0 , in1 , in2 , in3 ;
   reg reset , run_source , run_dest , run_cost, clock ;
   wire out0 , out1 , out2 , out3;
 // wire [4:0] state ;//, next_state;
  //wire [4:0]  i,j,k,x ;
  SPA_FPGA S(in0 , in1 , in2 , in3 , reset , run_source , run_dest , run_cost, clock , out0 , out1 , out2 , out3);
  initial
    begin
      clock = 0;
     forever
     #5 clock = ~clock;
    end
  
  initial
    begin
       reset = 1; run_source = 0; run_dest = 0; run_cost = 0;
      #30 reset = 0; 
      
      #115 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #50 run_source = 0; // source = 1
      #20 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #15 run_dest = 1; #50 run_dest = 0; // dest = 3
      #20 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_cost = 1; #50 run_cost = 0; // cost = 3
      
      #30  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0; // soirce = 3
      #25 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;  // dest = 4
      #30 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_cost = 1; #10 run_cost = 0;  // cost = 1;
      
      #35  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0; // source = 2
      #15  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; // dest = 1
      #30 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_cost = 1; #200 run_cost = 0; // cost = 2;
      
       #2000 run_cost = 0; 
     /* #10  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;*/
      
      #10  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #10  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      
      //for 4 vertices graph
       
      /*#115 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0; // source = 1
      #20 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #15 run_dest = 1; #30 run_dest = 0; // dest = 3
      #20 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_cost = 1; #40 run_cost = 0; // cost = 3
      
      #30  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0; // soirce = 3
      #25 in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;  // dest = 4
      #30 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_cost = 1; #10 run_cost = 0;  // cost = 1;
      
      #35  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0; // source = 2
      #15  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; // dest = 1
      #30 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_cost = 1; #10 run_cost = 0; // cost = 2;
       
      #40 in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0;  #10 run_source = 1; #30 run_source = 0; // source = 4
      #15 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_dest = 1; #30 run_dest = 0;  // dest = 1
      #10 in0 = 0; #10 in1 = 1 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_cost = 1; #10 run_cost = 0; // cost = 6
      
      #10 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_source = 1; #30 run_source = 0; // source = 3
      #15 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;  // dest = 2
      #15 in0 = 1; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_cost = 1; #10 run_cost = 0; // cost = 5
     
      
      #35 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      
      #2000  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #60 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40 in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_dest = 1; #30 run_dest = 0; #20 run_cost = 1; #30 run_cost = 0;
      
      #60 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      
      #100 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #30 run_source = 1; #30 run_source = 0;
      #40 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0; #30 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0;  #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      
      #100  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #30 run_source = 1; #30 run_source = 0;
      #40 in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0;#30 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      
      
      #100  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #30 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 0 ; #10 in2 = 0 ; #5 in3 = 0;#30 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40 in0 = 0; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0;#10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100   in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
      #40  in0 = 1; #10 in1 = 1 ; #10 in2 = 0 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;
      
      #100  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_source = 1; #30 run_source = 0;
    //  #40  in0 = 0; #10 in1 = 0 ; #10 in2 = 1 ; #5 in3 = 0; #10 run_dest = 1; #30 run_dest = 0;#20 run_cost = 1; #30 run_cost = 0;*/
      
     // #100 reset =  1; #20 reset = 0;
      
    //  #20 source = 4'b0011; dest = 4'b0001; cost = 4'b1000; // 1-3
     /* #10 source = 4'b0011; dest = 4'b0001; cost = 4'b1000;
      
      #10 source = 4'b0010 ; dest = 4'b0011; cost = 4'b0010; //2-3
      #10 source = 4'b0011; dest = 4'b0010; cost = 4'b0010;*/
      
     
      
      
   end
endmodule