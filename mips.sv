module mips(input logic clk, reset,
            output logic[31:0] pc,
            input logic[31:0] instr,
            output logic[1:0] memwrite,
            output logic[31:0] aluout, writedata,
            input logic[31:0] readdata);
  
  logic beq, bne, bge, bl, jr,  alusrca, alusrcb, s, regwrite, jump;
  logic[1:0] regdst;
  logic memsign;
  logic[2:0] regvalue;
  logic[3:0] aluop;
  logic undefined, OF, cause, excep;
  
  maindec controller(instr[31:26], instr[5:0],beq, bne, bge, bl, jr, alusrca, alusrcb,
                     s, regwrite, regdst,
                     memsign, memwrite, jump, regvalue, undefined, aluop);
  
  exceptionUnit excepU(undefined, s, OF, excep, cause);
  
  datapath dp(clk, reset, alusrca, alusrcb, regdst, regvalue, aluop, memsign, regwrite, s, cause, excep, jr,
              beq, bne, bge, bl, jump, instr, pc, readdata, aluout, writedata, OF);
  
endmodule
