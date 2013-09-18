//============================================================================//
//                                                                            //
//      BRAM dual port test bench                                             //
//                                                                            //
//      Module name: bram_sync_dp_tb                                          //
//      Desc: runs and tests the BRAM dual port module                        //
//      Date: Dec 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

`include "bram_sync_dp.v"

module bram_sync_dp_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_RAM_DATA_WIDTH = 8;
   localparam LOCAL_RAM_ADDR_WIDTH = 4;

   //=============
   // local regs
   //=============
   reg                           clk;
   reg                           rst;
   reg                           a_wr;
   reg [LOCAL_RAM_ADDR_WIDTH-1:0] a_addr;
   reg [LOCAL_RAM_DATA_WIDTH-1:0] a_data_in;
   reg                            b_wr;
   reg [LOCAL_RAM_ADDR_WIDTH-1:0] b_addr;
   reg [LOCAL_RAM_DATA_WIDTH-1:0] b_data_in;

   //==============
   // local wires 
   //==============
   wire [LOCAL_RAM_DATA_WIDTH-1:0] a_data_out;
   wire [LOCAL_RAM_DATA_WIDTH-1:0] b_data_out;

   
   //======================================
   // instance, "(d)esign (u)nder (t)est"
   //======================================
   bram_sync_dp #(
      .RAM_DATA_WIDTH (`ifdef RAM_DATA_WIDTH `RAM_DATA_WIDTH `else LOCAL_RAM_DATA_WIDTH `endif),
      .RAM_ADDR_WIDTH (`ifdef RAM_ADDR_WIDTH `RAM_ADDR_WIDTH `else LOCAL_RAM_ADDR_WIDTH `endif)
   ) dut (

      .rst        (rst),

      .a_clk      (clk),
      .a_wr       (a_wr),
      .a_addr     (a_addr),
      .a_data_in  (a_data_in),
      .a_data_out (a_data_out),
      
      .b_clk      (clk),
      .b_wr       (b_wr),
      .b_addr     (b_addr),
      .b_data_in  (b_data_in),
      .b_data_out (b_data_out)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk    = 0;
      rst    = 0;
      a_addr = 4'b0010; 
      a_data_in = 32'b1010101010101;
      a_wr = 1;
      #5 
      a_addr = 4'b0010;
      a_data_in = 32'b0101010101010;
      #5 
      a_addr = 4'b0001;
      a_data_in = 32'b0101010111010;
      #5 
      a_addr = 6;
      a_data_in = 32'b0101010111010;
   end

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
      #1 $display(a_data_out);
   end

   //===================
   // finish condition 
   //===================
   // 2 time units = 1 clock cycle
   initial #30 $finish;

endmodule

