`timescale 1ns / 1ps
 
 module SPA_FPGA(
 input in0 , in1 , in2 , in3,
 input reset , run_source , run_dest , run_cost , clock,
 output out0 , out1 , out2 , out3
 );
 //wire in0_d , in1_d , in2_d , in3_d, reset_d , run_source_d , run_dest_d , run_cost_d;
 
 /*Debouncer D1(clock , in0 , in0_d);
 Debouncer D2(clock , in1 , in1_d);
 Debouncer D3(clock , in2 , in2_d);
 Debouncer D4(clock , in3 , in3_d);
 Debouncer D5(clock , reset , reset_d);
 Debouncer D6(clock , run_source , run_source_d);
 Debouncer D7(clock , run_dest , run_dest_d);
 Debouncer D8(clock , run_cost , run_cost_d);*/
 
 wire [3:0] in , out;
  assign in = {in3 , in2 , in1 , in0};
  
  SPA F(in ,  reset, run_source , run_dest , run_cost , clock , out); 
  assign out0 = out[0]; 
  assign out1 = out[1];
  assign out2 = out[2];
  assign out3 = out[3];
   endmodule  
   
 /*module Debouncer (input clock, I, output reg O);

    reg [19:0] count = 20'b00000000000000000000;
    reg IReg;
    always @ (posedge clock)
        begin
            if (IReg != I)
                begin
                    IReg <= I;
                    count <= 20'b00000000000000000000;
                end
            else if (count == 1000000)
                O <= IReg;
            else
                count <= count + 1;
        end
endmodule*/
   
   module SPA(
   input [3:0] in , 
   input reset , run_source , run_dest , run_cost, clock ,
   output reg [3:0] out
   );    
   parameter VERTICES = 3;
   parameter EDGES = 3;
   
   reg [4:0] D[VERTICES :0][VERTICES-1 :0][VERTICES-1 : 0];  // integer
   reg [4:0] E[EDGES-1 :0][2 : 0];   //integer
  reg [4:0]  i,j,k,x ;   // integer
   
  
   
   parameter S0 = 5'b00000,
          S1 = 5'b00001,
          S2 = 5'b00010,
          S3 = 5'b00011,
          S4 = 5'b00100,
          S5 = 5'b00101,
          S6 = 5'b00110,
          S7 = 5'b00111,
          S8 = 5'b01000,
          S9 = 5'b01001,
          S10 = 5'b01010,
          S11 = 5'b01011,
          S12 = 5'b01100,
          S13 = 5'b01101,
          S14 = 5'b01110,
          S15 = 5'b01111,
          S16 = 5'b10000,
          S17 = 5'b10001,
          S18 = 5'b10010,
          S19 = 5'b10011,
          S20 = 5'b10100;
          //S21 = 5'b10101;
          
   reg [4:0]  next_state, state;
  reg [4:0] source , dest;   // integer
   
   always @(posedge clock)
   begin
        if(reset)
             state <= S0;
         else
             state <= next_state;
         if(run_source)
             source <= {1'b0 , in} - 5'b00001;
         if(run_dest)
             dest <= {1'b0 , in} - 5'b00001;
   end
 
 always @(posedge clock)
 begin
        case(state)
        S0 : begin 
                    i = 0; j = 0; k = 0; x = 0; out = 0; 
             end
        S1 : begin 
                   E[x][0] = {1'b0 , in} - 5'b00001; out = 0;
             end
        S2 : begin
                  out = 0;
             end
        S3 : begin 
                    E[x][1] =  {1'b0 , in} - 5'b00001; out = 0;
                end    
        S4 : begin 
                    out = 0;
                end  
        S5 : begin
                    E[x][2] = {1'b0 , in}; out = 0;
                end
        S6 : begin x = x+1; out = 0; end
        S7 : out = 0;
        S8 : begin
                  out = 0;
                if(i == j)
                  D[0][i][j] = 0;
                else
                 D[0][i][j] = 31;
              end
        S9 : begin
                out = 0; j = j +1;
                end
        S10 : begin i = i+1; j = 0; out = 0; end
        S11 : begin
                  i = 0; j = 0; k = 0; x = 0; out = 0;
                  end
        S12 : begin D[0][E[x][0]][E[x][1]] = E[x][2]; out = 0; end
        S13 :begin  x = x + 1; out = 0; end
        S14 : k = 1;
        S15 :  begin
                     if(D[k-1][i][k-1] == 31) //2147483647)
                            D[k][i][j] = D[k-1][i][j];
                     else if(D[k-1][k-1][j] == 31) //2147483647)
                            D[k][i][j] = D[k-1][i][j];
                     else if(D[k-1][i][j] > D[k-1][i][k-1] + D[k-1][k-1][j])
                            D[k][i][j] = D[k-1][i][k-1] + D[k-1][k-1][j];
                     else
                            D[k][i][j] = D[k-1][i][j];
                   end
          S16 : j = j + 1;
          S17 : begin j = 0; i = i + 1;end
          S18 :begin j = 0; i = 0; k = k + 1;end
          S19 : begin i = 0; j = 0; k = 0; x = 0; end
          S20 : out = D[VERTICES][source][dest];
         // S21 : begin out = 0; end
        endcase
 end
 
 
 always @(*)
 begin
 if(state == S0)
        begin
                if(run_source)
                   next_state <= S1;
                else
                    next_state <= S0;
        end
 else if(state == S1)
        begin
                      next_state <= S2;
                      
        end
 else if(state == S2)
        begin
                if(run_dest)
                      next_state <= S3;
                      else
                      next_state <= S2;
        end
 else if(state == S3)
        begin
                       next_state <= S4;       
        end
 else if(state == S4)
        begin
            if(run_cost)
            next_state <= S5;
            else 
            next_state <= S4;
        end
 else if(state == S5)
        begin
        if(run_cost == 1)
         next_state <= S5;
            else if(x == EDGES - 1)
               next_state <= S8;
            else
              next_state <= S6;
        end
 else if(state == S6)
        begin
           next_state <= S7;
        end
 else if(state == S7)
        begin
        if(run_source)
          next_state <= S1;
          else
          next_state <= S7;
        end
  
  else if(state == S8)
        begin
            if(j != VERTICES -1 )
             next_state <= S9;
             else if(i != VERTICES - 1)
             next_state <= S10;
             else
             next_state <= S11;
        end
  else if(state == S9 || state == S10)
             next_state <= S8;
  else if(state == S11)
             next_state <= S12;
  else if(state == S12)
            begin
             if( x != EDGES - 1)
              next_state <= S13;
              else
               next_state <= S14;
            end   
  else if(state == S13)
            begin
            next_state <= S12;
            end
  else if(state == S14)
            next_state <= S15;
   else if(state == S15)
            begin
             if( j != VERTICES -1)
             next_state <= S16;
             else if(i != VERTICES - 1)
             next_state <= S17;
             else if(k != VERTICES)
             next_state <= S18;
             else
             next_state <= S19;
             
            end
  else if(state == S16 || state == S17 || state == S18)
            next_state <= S15;
  else if(state == S19)
            begin
                if(run_cost)
                next_state <= S20;
                else
                next_state <= S19;
            end
  else
      next_state <= S19;
          
  
 end
   endmodule
          
