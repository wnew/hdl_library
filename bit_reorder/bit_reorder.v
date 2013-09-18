//============================================================================//
//                                                                            //
//      Parameterize Asyncronous Bit Reorderer                                //
//                                                                            //
//      Module name: bit_reorder                                              //
//      Desc: Asyncronously reorder a bit vector into the order specified by  //
//            the parameters                                                  //
//      Date: June 2012                                                       //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module bit_reorder #(
      //==============================
      // Top level block parameters
      //==============================
      parameter DATA_WIDTH   = 32,            // number of bits to reorder
      parameter BIT0         = 0,             // position of bit 0 in the new vector
      parameter BIT1         = 1,             // position of bit 1 in the new vector
      parameter BIT2         = 2,             // position of bit 2 in the new vector
      parameter BIT3         = 3,             // position of bit 3 in the new vector
      parameter BIT4         = 4,             // position of bit 4 in the new vector
      parameter BIT5         = 5,             // position of bit 5 in the new vector
      parameter BIT6         = 6,             // position of bit 6 in the new vector
      parameter BIT7         = 7,             // position of bit 7 in the new vector
      parameter BIT8         = 8,             // position of bit 8 in the new vector
      parameter BIT9         = 9,             // position of bit 9 in the new vector
      parameter BIT10        = 10,            // position of bit 10 in the new vector
      parameter BIT11        = 11,            // position of bit 11 in the new vector
      parameter BIT12        = 12,            // position of bit 12 in the new vector
      parameter BIT13        = 13,            // position of bit 13 in the new vector
      parameter BIT14        = 14,            // position of bit 14 in the new vector
      parameter BIT15        = 15,            // position of bit 15 in the new vector
      parameter BIT16        = 16,            // position of bit 16 in the new vector
      parameter BIT17        = 17,            // position of bit 17 in the new vector
      parameter BIT18        = 18,            // position of bit 18 in the new vector
      parameter BIT19        = 19,            // position of bit 19 in the new vector
      parameter BIT20        = 20,            // position of bit 20 in the new vector
      parameter BIT21        = 21,            // position of bit 21 in the new vector
      parameter BIT22        = 22,            // position of bit 22 in the new vector
      parameter BIT23        = 23,            // position of bit 23 in the new vector
      parameter BIT24        = 24,            // position of bit 24 in the new vector
      parameter BIT25        = 25,            // position of bit 25 in the new vector
      parameter BIT26        = 26,            // position of bit 26 in the new vector
      parameter BIT27        = 27,            // position of bit 27 in the new vector
      parameter BIT28        = 28,            // position of bit 28 in the new vector
      parameter BIT29        = 29,            // position of bit 29 in the new vector
      parameter BIT30        = 30,            // position of bit 30 in the new vector
      parameter BIT31        = 31             // position of bit 31 in the new vector
   ) (
      //===============
      // Input Ports
      //===============
      input wire                  en,
      input wire [DATA_WIDTH-1:0] in,
      
      //===============
      // Output Ports
      //===============
      output reg [DATA_WIDTH-1:0] out
   );

   always @* begin
      if (en) begin
         out <= {in[BIT31], in[BIT30], in[BIT29], in[BIT28], in[BIT27], in[BIT26], in[BIT25], in[BIT24], in[BIT23], in[BIT22], in[BIT21], in[BIT20], in[BIT19], in[BIT18], in[BIT17], in[BIT16], in[BIT15], in[BIT14], in[BIT13], in[BIT12], in[BIT11], in[BIT10], in[BIT9], in[BIT8], in[BIT7], in[BIT6], in[BIT5], in[BIT4], in[BIT3], in[BIT2], in[BIT1], in[BIT0]};
      end
   end
endmodule

