//============================================================================//
//                                                                            //
//      Bit Shifter                                                           //
//                                                                            //
//      Module name: bit_shift                                                //
//      Desc: Shifts a set of bits left or right by X bits                    //
//      Date: Nov 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module bit_shift #(
      //==============================
      // Module parameters
      //==============================
      parameter DATA_WIDTH = 8,              // number of input bits
      parameter SHIFT_DIRECTION = 1,         // 1 = shift right, 0 = shift left
      parameter NUMBER_BITS = 1,             // number of bits to shift
      parameter WRAP = 0                     // whether to wrap the shift or not
   
   ) (
      //==============
      // IO Ports
      //==============
      input  wire                  clk,
      input  wire [DATA_WIDTH-1:0] data_in,
      output reg  [DATA_WIDTH-1:0] data_out
   );
   
   // Synchronous logic
   always @(posedge clk) begin
      // Non wrapping
      if (WRAP == 0) begin
         data_out = SHIFT_DIRECTION = (data_in >> NUMBER_BITS) : (data_in << NUMBER_BITS)  
         if (SHIFT_DIRECTION) begin // right shift
            data_out <= data_in >> NUMBER_BITS;
         end else begin // left shift
            data_out <= data_in << NUMBER_BITS;
         end
      end
      // Wrapping   TODO: make this code wrap 
      if (WRAP) begin // (WRAP)
         if (SHIFT_DIRECTION) begin // right shift
            data_out <= data_in >> NUMBER_BITS;
         end else begin // left shift
            data_out <= data_in << NUMBER_BITS;
         end
      end
   end
   
endmodule

