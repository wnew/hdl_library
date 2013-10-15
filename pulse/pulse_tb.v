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

module pulse_tb;

   //===================
   // local parameters
   //===================
   localparam LOCAL_PULSE_LEN  = 2;
   localparam LOCAL_PULSE_FREQ = 8;

   //=============
   // local regs
   //=============
   reg clk;
   reg en;
   reg rst;
   
   //==============
   // local wires
   //==============
   wire pulse;

   //=====================================
   // instance, "(d)esign (u)nder (t)est"
   //=====================================
   pulse #(
      .PULSE_LEN  (LOCAL_PULSE_LEN),
      .PULSE_FREQ (LOCAL_PULSE_FREQ)
   ) dut (
      .clk   (clk), 
      .en    (en), 
      .rst   (rst), 
      .pulse (pulse)
   );

   //=============
   // initialize
   //=============
   initial begin
      $dumpvars;
      clk = 0;
      en  = 1;
      rst = 0;

      #50
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
   always @(posedge clk) $display(pulse);
   
   //===============================
   // finish after 100 clock cycles
   //===============================
   initial #100 $finish;

endmodule
