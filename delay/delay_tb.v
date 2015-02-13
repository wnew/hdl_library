//============================================================================//
//                                                                            //
//      Delay Test Bench                                                      //
//                                                                            //
//      Module name: delay_line_tb                                            //
//      Desc: runs and tests the delay module                                 //
//      Date: April 2012                                                      //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module delay_line_tb;

   reg        clk;
   reg  [7:0] din;
   wire [7:0] dout;
   wire       dvalid;

   delay #(
      .DELAY_TYPE   ("SYNC"),
      //.DELAY_TYPE   ("FIFO"),
      .DATA_WIDTH   (8),
      .DELAY_CYCLES (4) 
   ) dut (
      .clk    (clk),
      .din    (din),
      .dout   (dout),
      .dvalid (dvalid)
   );

   initial
   begin
      $dumpvars;
      $timeformat(-9, 1, "ns", 7);
      $display("\n===================================");
      $display(" Running testbench %m ");
      $display("===================================\n");
      $display("  ", "Time Datain Dataout");
      $monitor("\t%d %b %b", $realtime, din, dout);
      clk = 1;
      din = 8'hAB;
      #3
      din = 8'h11;
      #20
      $display("\n===================================");
      $display(" Passed : Testbench %m");
      $display("===================================\n");
      $finish;
   end

   always #1
   begin
      clk = ~clk;
   end

endmodule
