//============================================================================//
//                                                                            //
//      Parity Generator test bench                                           //
//                                                                            //
//      Module name: parity_generator_tb                                      //
//      Desc: runs and tests the parity generator module                      //
//      Date: Oct 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module parity_generator_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH  `DATA_WIDTH  `else 8 `endif;
   localparam PARITY_TYPE      = `ifdef PARITY_TYPE `PARITY_TYPE `else 0 `endif;

   //=============
   // local regs
   //=============
   reg                        clk;
   reg [LOCAL_DATA_WIDTH-1:0] data_in;
   
   //==============
   // local wires
   //==============
   wire parity_out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   parity_generator #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else 8 `endif),
      .PARITY_TYPE  (`ifdef PARITY_TYPE  `PARITY_TYPE  `else 0 `endif)
   ) dut (
      .data_in    (data_in),
      .parity_out (parity_out)
   );

   //=============
   // initialize
   //=============
   initial begin
      clk       = 0;
      data_in   = 8'hFF;
      #4
      data_in   = 8'b01010100;
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
   always @(posedge clk) begin
      //$display(count);
      $display(parity_out);
   end
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #10 $finish;

endmodule
