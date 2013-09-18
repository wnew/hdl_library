//============================================================================//
//                                                                            //
//      Parameterize Gray Counter                                             //
//                                                                            //
//      Module name: gray counter                                             //
//      Desc: parameterized gray counter, counts up to the specified data     //
//            width and repeats indefinitely.                                 //
//      Date: June 2012                                                       //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module gray_counter #(
      //=============
      // parameters
      //=============
      parameter DATA_WIDTH = 32
   ) (
      //===============
      // Input Ports
      //===============
      input wire clk,
      input wire en,
      input wire rst,
   
      //===============
      // Output Ports
      //===============
      output reg [DATA_WIDTH-1:0] count_out  //'Gray' code count output.
   );

   /////////Internal connections & variables///////
   reg [DATA_WIDTH-1:0] binary_count;

   always @ (posedge clk) begin
      if (rst) begin
         binary_count <= {DATA_WIDTH{1'b 0}} + 1;  //Gray count begins @ '1' with
         count_out    <= {DATA_WIDTH{1'b 0}};      // first 'en'.
      end else begin
         if (en) begin
            binary_count <=  binary_count + 1;
            count_out    <= {binary_count[DATA_WIDTH-1], binary_count[DATA_WIDTH-2:0] ^ binary_count[DATA_WIDTH-1:1]};
         end
      end
   end
endmodule
