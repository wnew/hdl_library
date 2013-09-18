//============================================================================//
//                                                                            //
//      Bit Slicer                                                            //
//                                                                            //
//      Module name: slice                                                    //
//      Desc: parameterized, bit slicer, outputs the remaining bits           //
//      Date: Nov 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module slice #(
      //===================
      // Slice Parameters
      //===================
      parameter INPUT_DATA_WIDTH = 8,          // number of input bits
      parameter OFFSET_REL_TO_MSB = 1,         // 1 = MSB, 0 = LSB
      parameter OFFSET_1 = 0,                  // position of first offset
      parameter OFFSET_2 = INPUT_DATA_WIDTH-1  // position of second offest
   ) (
      //===========
      // IO Ports
      //===========
      input  wire                        clk,
      input  wire [INPUT_DATA_WIDTH-1:0] data_in,
      output reg  [OFFSET_1-OFFSET_2:0]  data_out
   );

   // Synchronous logic
   always @(posedge clk) begin
      if (OFFSET_REL_TO_MSB) begin // (MSB)
         data_out <= data_in[OFFSET_2:OFFSET_1];
      end else begin // OFFSET_RELATIVE_TO_MSB = 0 (LSB)
         data_out <= data_in[(INPUT_DATA_WIDTH-1'd1)-OFFSET_1:(INPUT_DATA_WIDTH-1'd1)-OFFSET_2];
      end
   end
endmodule

