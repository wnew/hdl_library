//============================================================================//
//                                                                            //
//      Gray code to Binary converter                                         //
//                                                                            //
//      Module name: gray2bin                                                 //
//      Desc: parameterised module to convert gray coded numbers to binary    //
//            numbers                                                         //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module gray2bin #(
      //=============
      // Parameters
      //=============
      parameter DATA_WIDTH = 32
   ) (
      //============
      // I/O Ports
      //============
      input  [DATA_WIDTH-1:0] gray_in,
      output [DATA_WIDTH-1:0] binary_out
   );
   
   // gen vars
   genvar i;

   //=====================
   // Generate: gray2bin
   //=====================
   generate 
      for (i=0; i<DATA_WIDTH; i=i+1) begin
         assign binary_out[i] = ^ gray_in[DATA_WIDTH-1:i];
      end
   endgenerate

endmodule
