//============================================================================//
//                                                                            //
//      FIFO                                                                  //
//                                                                            //
//      Module name: fifo                                                     //
//      Desc: parameterized fifo                                              //
//      Date: Dec 2011                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: Uses the dual port BRAM module                                 //
//                                                                            //
//============================================================================//

module fifo #(
      //=======================
      // fifo parameters
      //=======================
      parameter DATA_WIDTH = 16,
      parameter FIFO_DEPTH = 1024,
      parameter ADDR_BITS  = 10
   ) (
      //=======================
      // input ports
      //=======================
      input                  wr_clk,
      input                  rd_clk,
      input                  en,
      input                  rst,
      input                  wr_req,
      input                  rd_req,
      input [DATA_WIDTH-1:0] data_in,
      
      //=======================
      // output ports
      //=======================
      output reg [DATA_WIDTH-1:0] data_out,
      output                      almost_full,
      output                      full,
      output                      empty,
      output     [ADDR_BITS-1:0]  usedw
   );

   
   //=======================
   // internal variables
   //=======================
   reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
   reg [ADDR_BITS-1:0] 	rd_ptr;
   reg [ADDR_BITS-1:0] 	wr_ptr;
   
   integer i;
   
   //=======================
   // reset logic 
   //=======================
   always @(rst) begin
      wr_ptr <= #1 0;
      rd_ptr <= #1 0;
      for(i=0;i<FIFO_DEPTH;i=i+1) begin
         mem[i] <= 0;
      end
   end
   
   //=======================
   // write logic 
   //=======================
   always @(posedge wr_clk or posedge wr_req) begin
      if (en && wr_req) begin
         wr_ptr <= wr_ptr+1;
         mem[wr_ptr] <= data_in;
      end
   end
     
   //=======================
   // read logic 
   //=======================
   always @(posedge rd_clk) begin
      if (en && rd_req) begin
         rd_ptr <= rd_ptr+1;
         data_out <= mem[rd_ptr];
      end
   end
   
   assign usedw       = wr_ptr - rd_ptr;
   assign empty       = usedw == 0;
   assign full        = usedw == FIFO_DEPTH-1;
   assign almost_full = usedw <  FIFO_DEPTH-6;
   
endmodule //fifo
