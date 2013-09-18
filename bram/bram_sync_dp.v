//============================================================================//
//                                                                            //
//      Syncronous dual-port BRAM                                             //
//                                                                            //
//      Module name: bram_sync_dp                                             //
//      Desc: parameterized, syncronous, inferable, true dual-port,           //
//            dual clock block ram                                            //
//      Date: Dec 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: Developed from a combiniation of bram implmentations           //
//             This is a read-before-write implementation of a BRAM           //
//                                                                            //
//============================================================================//

module bram_sync_dp #(
      //=============
      // Parameters
      //=============
      parameter RAM_DATA_WIDTH = 8,             // width of the data
      parameter RAM_ADDR_WIDTH = 4              // number of address bits
   ) (
      //================
      // General Ports
      //================
      input wire                       rst, 

      //=========
      // Port A
      //=========
      input  wire                      a_clk,
      input  wire                      a_wr,       // pulse a 1 to write and 0 reads
      input  wire [RAM_ADDR_WIDTH-1:0] a_addr, 
      input  wire [RAM_DATA_WIDTH-1:0] a_data_in,
      output reg  [RAM_DATA_WIDTH-1:0] a_data_out,
      
      //=========
      // Port B
      //=========
      input  wire                      b_clk,
      input  wire                      b_wr,       // pulse a 1 to write and 0 reads
      input  wire [RAM_ADDR_WIDTH-1:0] b_addr,
      input  wire [RAM_DATA_WIDTH-1:0] b_data_in,
      output reg  [RAM_DATA_WIDTH-1:0] b_data_out
   );
   
   //===============
   // Local Params
   //===============
   localparam RAM_DATA_DEPTH = 2**RAM_ADDR_WIDTH;  // depth of the ram, this is tied to the number of address bits
   
   //================
   // Shared memory
   //================
   reg [RAM_DATA_WIDTH-1:0] mem [RAM_DATA_DEPTH-1:0];
   
   //=========
   // Port A
   //=========
   always @(posedge a_clk) begin
      if (`ifdef ACTIVE_LOW_RST !rst `else rst `endif)
         a_data_out <= {RAM_DATA_WIDTH{1'b0}};
      else begin 
         a_data_out  <= mem[a_addr];
         if (a_wr) begin
            mem[a_addr] <= a_data_in;
         end
      end
   end
   
   //=========
   // Port B
   //=========
   always @(posedge b_clk) begin
      if (`ifdef ACTIVE_LOW_RST !rst `else rst `endif)
         b_data_out <= {RAM_DATA_WIDTH{1'b0}};
      else begin
         b_data_out <= mem[b_addr];
         if (b_wr) begin
            mem[b_addr] <= b_data_in;
         end
      end
   end
endmodule
