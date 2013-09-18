//============================================================================//
//                                                                            //
//      Binary to Gray code converter                                         //
//                                                                            //
//      Module name: bin2gray                                                 //
//      Desc: parameterised module to convert binary numbers to gray encoded  //
//            numbers                                                         //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module bin2gray #(
      //=============
      // Parameters
      //=============
      parameter DATA_WIDTH = 32
   ) (
      //============
      // I/O Ports
      //============
      input  [DATA_WIDTH-1:0] binary_in,
      output [DATA_WIDTH-1:0] gray_out
   );

   //====================
   // FUNC: binary2gray
   //====================
   function [DATA_WIDTH-1:0] binary2gray;
      input [DATA_WIDTH-1:0] value;
      integer i;
      begin 
         binary2gray[DATA_WIDTH-1] = value[DATA_WIDTH-1];
         for (i = DATA_WIDTH-1; i > 0; i = i - 1) begin
            binary2gray[i - 1] = value[i] ^ value[i - 1];
         end
      end
   endfunction

   assign gray_out = binary2gray(binary_in);
endmodule
