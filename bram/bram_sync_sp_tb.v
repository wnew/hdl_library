//============================================================================//
//                                                                            //
//      BRAM single port test bench                                           //
//                                                                            //
//      Module name: bram_sync_sp_tb                                          //
//      Desc: runs and tests the BRAM single port module                      //
//      Date: Dec 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

`include "bram_sync_sp.v"

module bram_sync_sp_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_RAM_DATA_WIDTH = 8;
   localparam LOCAL_RAM_ADDR_WIDTH = 4;
   localparam LOCAL_RAM_DATA_DEPTH = 2**LOCAL_RAM_ADDR_WIDTH;

   //=============
   // local regs
   //=============
   reg                        clk;
   reg                        rst;
   reg                        wr;
   reg [LOCAL_RAM_ADDR_WIDTH-1:0] addr;
   reg [LOCAL_RAM_DATA_WIDTH-1:0] data_in;

   //==============
   // local wires 
   //==============
   wire [LOCAL_RAM_DATA_WIDTH-1:0] data_out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   bram_sync_sp #(
      .RAM_DATA_WIDTH (`ifdef RAM_DATA_WIDTH `RAM_DATA_WIDTH `else LOCAL_RAM_DATA_WIDTH `endif),
      .RAM_ADDR_WIDTH (`ifdef RAM_ADDR_WIDTH `RAM_ADDR_WIDTH `else LOCAL_RAM_ADDR_WIDTH `endif)
   ) dut (

      .clk      (clk),
      .rst      (rst),
      .wr       (wr),
      .addr     (addr),
      .data_in  (data_in),
      .data_out (data_out)
   );

   //=====================
   // simulate the clock
   //=====================
   always #1 begin
      clk = ~clk;
   end

   //===============
   // print output
   //===============
   always begin
      #2 $display(data_out);
   end

   //===================
   // finish condition 
   //===================
   // 2 time units = 1 clock cycle
   initial #30 $finish;

endmodule

