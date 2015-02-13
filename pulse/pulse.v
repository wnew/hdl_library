//============================================================================//
//                                                                            //
//      Parameterize Counter                                                  //
//                                                                            //
//      Module name: counter                                                  //
//      Desc: parameterized counter, counts up/down in any increment          //
//      Date: Oct 2011                                                        //
//      Developer: Rurik Primiani & Wesley New                                //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module pulse #(
      //==============================
      // Top level block parameters
      //==============================
      parameter PULSE_FREQ  = 10, // Number of cycles between pulses
      parameter PULSE_WIDTH = 1   // Number of cycles each pulse lasts
   ) (
      //==============
      // Input Ports
      //==============
      input clk,
      input en,
      input rst,
      
      //===============
      // Output Ports
      //===============
      output pulse
   );

   reg pulse_state;

   localparam PULSE_LOW  = 0;
   localparam PULSE_HIGH = 1; 

   reg [31:0] count;

   assign pulse = pulse_state;

   // Synchronous logic
   always @(posedge clk) begin
      // if ACTIVE_LOW_RST is defined then reset on a low
      // this should be defined on a system-wide basis
      if ((`ifdef ACTIVE_LOW_RST rst `else !rst `endif)) begin
         if (en) begin
            count <= count + 1'b1;
            if (count < PULSE_WIDTH)
               pulse_state <= PULSE_HIGH;
            else if (count < PULSE_FREQ-1)
               pulse_state <= PULSE_LOW;
            else
               count <= 1'b0;
         end
      end else begin
         pulse_state = PULSE_HIGH;
         count = 0;
      end
   end
endmodule

