//============================================================================//
//                                                                            //
//      Counter test bench                                                    //
//                                                                            //
//      Module name: counter_tb                                               //
//      Desc: runs and tests the counter module, and provides and interface   //
//            to test the module from Python (MyHDL)                          //
//      Date: Oct 2011                                                        //
//      Developer: Rurik Primiani & Wesley New                                //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

module edge_detect_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = 8;
   localparam LOCAL_EDGE_TYPE  = "DUAL";

   //=============
   // local regs
   //=============
   reg clk;
   reg en;
   reg [LOCAL_DATA_WIDTH-1:0] in;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   edge_detect #(
      .DATA_WIDTH (LOCAL_DATA_WIDTH),
      .EDGE_TYPE  (LOCAL_EDGE_TYPE)
   ) dut (
      .clk       (clk), 
      .en        (en), 
      .in        (in), 
      .pulse_out (out)
   );

   
   //=============
   // initialize
   //=============
   initial
   begin
      $dumpvars;
      clk = 1'b0;
      en  = 1'b1;
      in  = 8'b10101010;
      #5
      in  = 8'b01010101;
      #5
      in  = 8'b11110000;
      #5
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
   initial #20 $finish;

endmodule
