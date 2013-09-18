//============================================================================//
//                                                                            //
//      Parameterize Parity Generator                                         //
//                                                                            //
//      Module name: parity_generator                                         //
//      Desc: parity generator, generates a single bit parity for a specified //
//            input data width                                                //
//      Date: Oct 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module parity_generator #(
      //=============
      // Parameters
      //=============
      parameter DATA_WIDTH  = 32,
      parameter PARITY_TYPE = 0   // 0 - Even Parity, 1 - Odd Parity
   ) (
      //==============
      // Input Ports
      //==============
      input  [DATA_WIDTH-1:0] data_in,

      //===============
      // Input Ports
      //===============
      output reg              parity_out
   );

   always @(*) begin
      parity_out = PARITY_TYPE ? !(^data_in[DATA_WIDTH-1:0]) : ^data_in[DATA_WIDTH-1:0];
   end

endmodule
