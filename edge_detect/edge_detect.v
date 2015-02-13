//============================================================================//
//                                                                            //
//      Edge Detect                                                           //
//                                                                            //
//      Module name: edge_detect                                              //
//      Desc: detects rising falling or either edge                           //
//      Date: Jan 2014                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module edge_detect #(

      //===================
      // local parameters
      //===================
      parameter DATA_WIDTH = 8,
      parameter EDGE_TYPE  = "RISE"
   ) (
      //=============
      // local regs
      //=============
      input clk,
      input en,
      input [DATA_WIDTH-1:0] in,
      
      //==============
      // local wires
      //==============
      output [DATA_WIDTH-1:0] pulse_out
   );

   reg [DATA_WIDTH-1:0] delay_reg;
   reg [DATA_WIDTH-1:0] delay_reg1;

   always@(posedge clk) begin
      delay_reg  <= in;
      delay_reg1 <= delay_reg;
   end

   case (EDGE_TYPE)
      "RISE" : assign pulse_out =  in & ~delay_reg1;
      "FALL" : assign pulse_out = ~in &  delay_reg1;
      "DUAL" : assign pulse_out =  in ^  delay_reg1;
      defaut : assign pulse_out =  in & ~delay_reg1; 
   endcase
        


endmodule
