//============================================================================//
//                                                                            //
//      Adder test bench                                                      //
//                                                                            //
//      Module name: adder_tb                                                 //
//      Desc: runs and tests the adder module                                 //
//      Date: April 2012                                                      //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

//TODO: Include functionality to subtract in this module

module adder_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH_1 = 16;
   localparam LOCAL_DATA_WIDTH_2 = 16;

   //=============
   // local regs
   //=============
   reg                          clk;
   reg signed [LOCAL_DATA_WIDTH_1-1:0] data1_i;
   reg signed [LOCAL_DATA_WIDTH_2-1:0] data2_i;
   
   //==============
   // local wires
   //==============
   `ifdef LOCAL_DATA_WIDTH_1 > LOCAL_DATA_WIDTH_2
   wire signed [LOCAL_DATA_WIDTH_1:0]   signed_data_o;
   wire        [LOCAL_DATA_WIDTH_1:0] unsigned_data_o;
   `else
   wire signed [LOCAL_DATA_WIDTH_2:0]   signed_data_o;
   wire        [LOCAL_DATA_WIDTH_2:0] unsigned_data_o;
   `endif

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   adder #(
      .SIGNED       (1),
      .DATA_WIDTH_1 (LOCAL_DATA_WIDTH_1),
      .DATA_WIDTH_2 (LOCAL_DATA_WIDTH_2)
   ) signed_dut (
      .clk     (clk),
      .data1_i (data1_i),
      .data2_i (data2_i),
      .data_o  (signed_data_o)
   );
   
   adder #(
      .SIGNED       (0),
      .DATA_WIDTH_1 (LOCAL_DATA_WIDTH_1),
      .DATA_WIDTH_2 (LOCAL_DATA_WIDTH_2)
   ) unsigned_dut (
      .clk     (clk),
      .data1_i (data1_i),
      .data2_i (data2_i),
      .data_o  (unsigned_data_o)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      $display("Adder TB");
      $display("=====================");
      clk = 0;
      $display("Signed Integers");
      data1_i = 16'h52F2;
      data2_i = 16'h3671;
      #2
      data2_i = 16'h2234;
      #6
      data1_i = 16'h8929;
      #8
      data2_i = 16'hF712;
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
   end
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #30 $finish;

endmodule
