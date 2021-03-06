//============================================================================//
//                                                                            //
//      Parameterise Multiplexer                                              //
//                                                                            //
//      Module name: mux                                                      //
//      Desc: parameterized mutiplexer, selects one of X inputs               //
//      Date: Oct 2011                                                        //
//      Developer: Rurik Primiani & Wesley New                                //
//      Licence: GNU General Public License ver 3                             //
//      Notes: Developed from a combiniation of mux implmentations            //
//                                                                            //
//============================================================================//

module mux #(
      //=================
      // Mux parameters
      //=================
      parameter SELECT_LINES = 4,             // number of inputs into mux, must be a power of 2.
      parameter DATA_WIDTH   = 1              // the width of the output data
   ) (
      //==============
      // Input Ports
      //==============
      input wire [SELECT_LINES-1:0]                 select,
      input wire [DATA_WIDTH*(2**SELECT_LINES)-1:0] data_in,

      //===============
      // Output Ports
      //===============
      output reg [DATA_WIDTH-1:0] data_out
   );

   //==================
   // Local variables
   //==================
   integer i,j;
   
   //====================
   // Multiplexor logic 
   //====================
   always @(select or data_in) begin
      j = select;
      for (i = 0; i < DATA_WIDTH; i = i +1) begin
         data_out[i] = data_in[DATA_WIDTH * j + i];
      end
   end
endmodule

