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

module counter_tb;

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
   wire [LOCAL_DATA_WIDTH-1:0] count;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   counter #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else 8            `endif),
      .COUNT_FROM   (`ifdef COUNT_FROM   `COUNT_FROM   `else 0            `endif),
      .COUNT_TO     (`ifdef COUNT_TO     `COUNT_TO     `else 10           `endif),
      .STEP         (`ifdef STEP         `STEP         `else 1            `endif)
   ) dut (
      .clk   (clk),
      .en    (en),
      .rst   (rst),
      .count (count)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk = 0;
      en  = 1;
      rst = 0;

      #1000
      en = 0;
      #10
      en = 1;
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
   always @(posedge clk) $display(count);

   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #1000 $finish;

endmodule
