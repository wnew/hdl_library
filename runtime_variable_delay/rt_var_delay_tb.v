//============================================================================//
//                                                                            //
//      Runtime Variable Delay test bench                                     //
//                                                                            //
//      Module name: rt_var_delay_tb                                          //
//      Desc: runs and tests the rt_var_delay module                          //
//      Date: Jan 2014                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module rt_var_delay_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH    = 8'h8;
   localparam LOCAL_INITIAL_DELAY = 8'h8;
   localparam LOCAL_DELAY_DEPTH   = 8'h8;

   //=============
   // local regs
   //=============
   reg clk;
   reg en;
   reg in;
   reg [4:0] delay;

   //==============
   // local wires
   //==============
   wire out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   rt_var_delay #(
      .DATA_WIDTH (LOCAL_DATA_WIDTH)
   ) dut (
      .clk (clk), 
      .en  (en), 
      .delay (delay),
      .in  (in), 
      .out (out)
   );

   
   //=============
   // initialize
   //=============
   initial
   begin
      $dumpvars;
      clk = 1'b1;
      en  = 1'b1;
      delay = 5'd3;
      in  = 8'b10101010;
      #6
      in  = 8'b01010101;
      #4
      delay = 5'd5;
      in  = 8'b11110000;
      #8
      in  = 8'b00001111;
   end

   //====================
   // simulate the clock
   //====================
   always #1
   begin
      clk = ~clk;
   end

   //===============
   // print output
   //===============
   always @(negedge clk) $display(out);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #100 $finish;

endmodule
