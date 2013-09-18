//============================================================================//
//                                                                            //
//      Logical Bitwise Inverter                                              //
//                                                                            //
//      Module name: inverter                                                 //
//      Desc: parameterised logical bitwise inverter                          //
//      Date: Sept 2012                                                       //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes: not a very complex module                                      //
//                                                                            //
//============================================================================//

module inverter #(
      //=============
      // Parameters
      //=============
      parameter DATA_WIDTH = 32
   ) (
      //============
      // I/O Ports
      //============
      input  [DATA_WIDTH-1:0] data_in,
      output [DATA_WIDTH-1:0] data_out
   );

   assign data_out = ~data_in;

endmodule
