//============================================================================//
//                                                                            //
//      Parameterize multiplier                                               //
//                                                                            //
//      Module name: multiplier                                               //
//      Desc: parameterized multiplier module                                 //
//      Date: Mar 2012                                                        //
//      Developer: Kaushal Buch                                               //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module multiplier #(
      //=============================
      // Top level block parameters
      //=============================
      parameter SIGNED       =  1,  // signed number or not 
      parameter DATA_WIDTH_1 = 16,  // number of input bits (multiplier)
      parameter DATA_WIDTH_2 = 16   // number of input bits (multiplicand)
   ) (
      //==============
      // Input Ports
      //==============
      input                    clk,
      `ifdef SIGNED
      input signed [DATA_WIDTH_1-1:0] data1_i,
      input signed [DATA_WIDTH_2-1:0] data2_i,
      `else
      input        [DATA_WIDTH_1-1:0] data1_i,
      input        [DATA_WIDTH_2-1:0] data2_i,
      `endif
      //===============
      // Output Ports
      //===============
      `ifdef SIGNED
      output reg signed [(DATA_WIDTH_1 + DATA_WIDTH_2) -1:0] data_o
      `else
      output reg        [(DATA_WIDTH_1 + DATA_WIDTH_2) -1:0] data_o
      `endif
   );

   //=======================
   // Multiplication Logic
   //=======================
   always @ (posedge clk) begin
      data_o <= data1_i * data2_i;
   end

endmodule
