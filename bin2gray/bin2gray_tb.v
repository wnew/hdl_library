//============================================================================//
//                                                                            //
//      Binary to Gray code converter test bench                              //
//                                                                            //
//      Module name: bin2gray_tb                                              //
//      Desc: runs and tests the bin2gray module                              //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

module bin2gray_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 8 `endif;

   //=============
   // local regs
   //=============
   reg clk;
   reg [LOCAL_DATA_WIDTH-1:0] data_in;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] data_out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   bin2gray #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else LOCAL_DATA_WIDTH `endif)
   ) dut (
      .binary_in (data_in), 
      .gray_out  (data_out) 
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk      = 0;
      data_in  = 8'b01010101;
      #3
      data_in  = 8'b01010111;
      #3
      data_in  = 8'b01010011;
      #3
      data_in  = 8'b01011011;
      #3
      data_in  = 8'b01110011;
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
   always @(posedge clk) $display(data_out);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #20 $finish;

endmodule
