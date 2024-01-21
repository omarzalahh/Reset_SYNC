/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Sep 15 01:36:35 2022
/////////////////////////////////////////////////////////////


module RST_SYNC ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \Flipflops[0] ;

  DFFRQX2M \Flipflops_reg[1]  ( .D(\Flipflops[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \Flipflops_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(
        \Flipflops[0] ) );
endmodule

