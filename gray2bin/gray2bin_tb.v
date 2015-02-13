//============================================================================//
//                                                                            //
//      Gray to Binary converter test bench                                   //
//                                                                            //
//      Module name: gray2bin_tb                                              //
//      Desc: runs and tests the gray2bin module                              //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

`timescale 1ns/100ps

module gray2bin_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 8 `endif;
   
   //=============
   // local regs
   //=============
   reg                        clk;
   reg [LOCAL_DATA_WIDTH-1:0] data_in;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] data_out;
   
   //==================
   // local variables
   //==================
   reg error = 0;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   gray2bin #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else LOCAL_DATA_WIDTH `endif)
   ) dut (
      .gray_in    (data_in), 
      .binary_out (data_out) 
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      $timeformat(-9, 1, "ns", 7);
      $display("\n===================================");
      $display(" Running testbench %m ");
      $display("===================================\n");
      $display("  ", "Time Datain Dataout");
      $monitor("\t%d %b %b", $realtime, data_in, data_out);
      error   = 0;
      clk      = 0;
      data_in  = 8'b01010101;
      #3
      if (data_out != 8'b01100110)
         error = 1;
      data_in  = 8'b01010111;
      #3
      if (data_out != 8'b01100101)
         error = 1;
      data_in  = 8'b01010011;
      #3
      if (data_out != 8'b01100010)
         error = 1;
      data_in  = 8'b01011011;
      #3
      if (data_out != 8'b01101101)
         error = 1;
      data_in  = 8'b01110011;
      #3
      if (data_out != 8'b01011101)
         error = 1;
      #7

      $display("\n===================================");
      if (error)
        $display(" Failed : Testbench %m");
      else
        $display(" Passed : Testbench %m");

      $display("===================================\n");
      $finish;
   end

   //====================
   // simulate the clock
   //====================
   always #1 begin
      clk = ~clk;
   end

endmodule
