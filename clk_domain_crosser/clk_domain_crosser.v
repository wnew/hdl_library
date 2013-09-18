//============================================================================//
//                                                                            //
//      Parameterize Clock Domain Crosser                                     //
//                                                                            //
//      Module name: clk_domain_crosser                                       //
//      Desc: parameterized module to move data demains clock domains         //
//      Date: Sept 2013                                                       //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: this module uses 2 registers to syncronize between clock       //
//             domains                                                        //
//                                                                            //
//============================================================================//

module clk_domain_crosser #(
      parameter DATA_WIDTH = 32
   ) (
      //===============
      // Input Ports
      //===============
      input                  clk1,
      input                  clk2,
      input                  rst,
      input  [DATA_WIDTH-1:0] data_in,
      
      //===============
      // Output Ports
      //===============
      output [DATA_WIDTH-1:0] data_out
   );
 
   reg [DATA_WIDTH-1:0] data_out_meta;
   reg [DATA_WIDTH-1:0] data_out_reg;
   reg [DATA_WIDTH-1:0] data_out_reg_r;
   wire[DATA_WIDTH-1:0] data_out;
    
   // Assign statements
   assign data_out = data_out_reg_r;
    
   // Always block to declare  synchronous logic from source clock domain 
   always @ (posedge clk1) begin
      data_out_meta <= data_in;
   end
   // Always block to declare synchronous logic in destination clock domain
    
   always @ (posedge clk2 or posedge rst) begin
      if (`ifdef ACTIVE_LOW_RST !rst `else rst `endif) begin
         data_out_reg   <= 'b0;
         data_out_reg_r <= 'b0;
      end else begin
         data_out_reg   <= data_out_meta;
         data_out_reg_r <= data_out_reg;
      end
   end
endmodule
