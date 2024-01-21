module RST_SYNC_tb #(
       parameter NUM_STAGES =2 )
();
reg  rst_tb                   ;
reg  clk_tb                   ;
wire SYNC_RST_tb              ;

//Initial 
initial
 begin
$dumpfile("RST_SYNC.vcd") ;       
$dumpvars;
initialize();
reset();
repeat (3) @(posedge clk_tb);
if (SYNC_RST_tb==1'b1) begin
         $display ("TEST CASE  IS PASSED") ;
end else begin
         $display ("TEST CASE  IS FAILED") ;
end  



#100

$finish ;

end

////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

/////////////// Signals Initialization //////////////////

task initialize ;
 begin
 clk_tb=1'b0  ;
              
 end
endtask
///////////////////////// RESET /////////////////////////

task reset ;
 begin
  rst_tb = 1'b1  ;  
  #1
  rst_tb = 1'b0  ;  
  #1
  rst_tb = 1'b1  ;  
 end
endtask


////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////

always #20 clk_tb = ~clk_tb ;
////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////

RST_SYNC #(.NUM_STAGES(NUM_STAGES)) DUT
(

.RST      (rst_tb)    ,
.CLK      (clk_tb)    ,
.SYNC_RST (SYNC_RST_tb)

);
           

endmodule