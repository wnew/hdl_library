//============================================================================//
//                                                                            //
//      Syncronous single-port BRAM                                           //
//                                                                            //
//      Module name: bram_sync_sp                                             //
//      Desc: parameterized, syncronous, single-port block ram                //
//      Date: Dec 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: Developed from a combiniation of bram implmentations           //
//                                                                            //
//============================================================================//

module bram_sync_sp #(
       //=============
       // Parameters
       //=============
       parameter RAM_DATA_WIDTH = 32,
       parameter RAM_ADDR_WIDTH = 4
   ) (
       //========
       // Ports
       //========
       input  wire                      clk,
       input  wire                      rst,
       input  wire                      wr,
       input  wire [RAM_ADDR_WIDTH-1:0] addr,
       input  wire [RAM_DATA_WIDTH-1:0] data_in,
       output reg  [RAM_DATA_WIDTH-1:0] data_out
   );

   //=========
   // Memory
   //=========
   reg [RAM_DATA_WIDTH-1:0] mem [(2**RAM_ADDR_WIDTH)-1:0];
   

   always @(posedge clk) begin
      if (`ifdef ACTIVE_LOW_RST !rst `else rst `endif) begin
         data_out <= {RAM_DATA_WIDTH{1'b0}};
      end
      else begin
         data_out <= mem[addr];
         if (wr) begin
            mem[addr] <= data_in;
         end
      end
   end
endmodule
