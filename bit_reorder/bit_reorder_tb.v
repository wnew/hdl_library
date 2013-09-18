//============================================================================//
//                                                                            //
//      Bit Reorder test bench                                                //
//                                                                            //
//      Module name: bit_reorder_tb                                           //
//      Desc: runs and tests the bit_reorder module                           //
//      Date: June 2012                                                       //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: This only tests the basic functionality of the module, more    //
//             comprehensive testing is done in the python test file          //
//                                                                            //
//============================================================================//

module bit_reorder_tb;

   //===================
   // local paramters
   //===================
   localparam LOCAL_DATA_WIDTH = `ifdef DATA_WIDTH `DATA_WIDTH `else 32 `endif;

   //=============
   // local regs
   //=============
   reg                        en;
   reg [LOCAL_DATA_WIDTH-1:0] in;
   
   //==============
   // local wires
   //==============
   wire [LOCAL_DATA_WIDTH-1:0] out;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   bit_reorder #(
      .DATA_WIDTH   (`ifdef DATA_WIDTH   `DATA_WIDTH   `else 32           `endif),
      .BIT0  (0), 
      .BIT1  (5), 
      .BIT2  (6), 
      .BIT3  (7), 
      .BIT4  (1), 
      .BIT5  (2), 
      .BIT6  (3), 
      .BIT7  (4), 
      .BIT8  (8), 
      .BIT9  (9), 
      .BIT10 (10),
      .BIT11 (11),
      .BIT12 (12),
      .BIT13 (13),
      .BIT14 (14),
      .BIT15 (15),
      .BIT16 (16),
      .BIT17 (17),
      .BIT18 (18),
      .BIT19 (19),
      .BIT20 (20),
      .BIT21 (21),
      .BIT22 (22),
      .BIT23 (23),
      .BIT24 (24),
      .BIT25 (25),
      .BIT26 (26),
      .BIT27 (27),
      .BIT28 (28),
      .BIT29 (29),
      .BIT30 (30),
      .BIT31 (31)  
   ) dut (
      .en  (en),
      .in  (in), 
      .out (out)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      en = 1;
      in = 32'b11110000111100001111000011110000;
   end

   //===============
   // print output
   //===============
   always #1
      $display("%b", out);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #10 $finish;

endmodule
