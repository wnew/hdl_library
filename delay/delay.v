//============================================================================//
//                                                                            //
//      Parameterize Delay                                                    //
//                                                                            //
//      Module name: delay                                                    //
//      Desc: parameterized delay, which can implement fifo or sync delays    //
//      Date: April 2012                                                      //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module delay #(
      //=============
      // parameters
      //=============
      parameter DELAY_TYPE   = "FIFO",       // SYNC (COUNTER), REGISTERS (FIFO)
      parameter DATA_WIDTH   = 32,           // width of the data to delay 
      parameter DELAY_CYCLES = 1             // delay in number of clock cycles
   ) (
      //=====================
      // input/output ports
      //=====================
      input                   clk,
      input                   en,
      input                   rst,
      input  [DATA_WIDTH-1:0] din,
      output [DATA_WIDTH-1:0] dout,
      output                  dvalid
   );

   // Generate according to implementation
   generate
      // Generate counter type
      case (DELAY_TYPE)
         //============================
         // Sync delay implementation
         //============================
         "SYNC" : begin  // outputs the input data after the desired amount of clock cycles have passed
            sync_delay #(
               .DATA_WIDTH   (DATA_WIDTH),
               .DELAY_CYCLES (DELAY_CYCLES)
            ) dut (
               .clk    (clk),
               .din    (din),
               .dout   (dout),
               .dvalid (dvalid)
            );
         end

         //============================
         // FIFO delay implementation
         //============================
         "FIFO" : begin // shifts the input data through a FIFO
            fifo_delay #(
               .DATA_WIDTH   (DATA_WIDTH),
               .DELAY_CYCLES (DELAY_CYCLES)
            ) dut (
               .clk    (clk),
               .din    (din),
               .dout   (dout),
               .dvalid (dvalid)
            );
         end
      endcase
   endgenerate
endmodule

