module  RST_SYNC  # (parameter  NUM_STAGES=2)
  (
input    wire     CLK,
input    wire     RST,
output   wire    SYNC_RST    
  );
  //internal signal
reg  [NUM_STAGES-1:0] Flipflops;
//synchronizer
always  @ (posedge  CLK or negedge RST)
  begin
    if(!RST)
      Flipflops<='b0;
    else
      begin
        if(NUM_STAGES==1)
          Flipflops<='b1;
        else
         Flipflops<={Flipflops[NUM_STAGES-2:0],1'b1}; 
      end
  end
//output from module
assign  SYNC_RST=Flipflops[NUM_STAGES-1];
endmodule
