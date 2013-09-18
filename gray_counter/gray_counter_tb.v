//============================================================================//
//                                                                            //
//      Counter test bench                                                    //
//                                                                            //
//      Module name: counter_tb                                               //
//      Desc: runs and tests the counter module                               //
//      Date: Oct 2011                                                        //
//      Developer: Rurik Primiani & Wesley New                                //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

module gray_counter_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 8 `endif;

   //=============
   // local regs
   //=============
   reg clk;
   reg en;
   reg rst;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   gray_counter #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else LOCAL_DATA_WIDTH `endif)
   ) dut (
      .clk       (clk), 
      .en        (en), 
      .rst       (rst), 
      .count_out (out)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk = 0;
      en  = 1;
      rst = 1;
      #2
      rst = 0;
   end

   //====================
   // simulate the clock
   //====================
   always #1 begin
      clk = ~clk;
   end

   //===============
   // print output
   //===============
   always @(posedge clk) $display(out);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #100 $finish;

endmodule
