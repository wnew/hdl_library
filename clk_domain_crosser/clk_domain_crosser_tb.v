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

module clk_domain_crosser_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 32 `endif;

   //=============
   // local regs
   //=============
   reg clk1;
   reg clk2;
   reg rst;
   reg [LOCAL_DATA_WIDTH-1:0] data_in;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] data_out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   clk_domain_crosser #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH `DATA_WIDTH `else 32 `endif)
   ) dut (
      .clk1      (clk1),
      .clk2      (clk2),
      .rst       (rst),
      .data_in   (data_in),
      .data_out  (data_out)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk1 = 0;
      clk2 = 0;
      rst  = 0;

      data_in = 32'h1234EFEF;
      #4
      data_in = 32'hEEEEEEEE;
      #4
      data_in = 32'h1F184FE4;
      #4
      data_in = 32'h11111111;
      #4
      data_in = 32'h1F1F1F1F;
      #4
      data_in = 32'h1234EFEF;
      #16
      $finish;
   end

   //====================
   // simulate the clock
   //====================
   always #1 begin
      clk1 = ~clk1;
   end
   always #2 begin
      clk2 = ~clk2;
   end

   //===============
   // print output
   //===============
   always @(posedge clk1) begin
      $display(data_out);
   end
   
endmodule
