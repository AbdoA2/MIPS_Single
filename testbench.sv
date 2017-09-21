module testbench();
  
  logic clk, reset;
  logic[31:0] dataadr, writedata, instr, pc;
  logic[1:0] memwrite;
  
  top dut(clk, reset, dataadr, writedata, instr, pc, memwrite);
  
  initial 
    begin
      reset <= 1; #10; reset <= 0; #10;
    end
    
  always
    begin
      clk <= 1; #500; clk <= 0; #500;
    end
    
  always@(negedge clk)
    begin
      //$display("%h", instr);
      if (memwrite == 0'b01) begin
        $display("%h", writedata);
      end
    end
  
  
  
endmodule
