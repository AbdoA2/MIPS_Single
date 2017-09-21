module maindec(input logic[5:0] op,
               input logic[5:0] funct,
               output logic beq, bne, bge, bl,
               output logic jr,
               output logic alusrca, alusrcb,
               output logic s,
               output logic regwrite,
               output logic[1:0] regdst,
               output logic memsign,
               output logic[1:0] memwrite,
               output logic jump,
               output logic[2:0] regvalue,
               output logic undefined,
               output logic[3:0] aluop);
  
  logic[22:0] controls;
  
  assign {beq, bne, bge, bl, jr, alusrca, alusrcb, s, regwrite,
   regdst, memsign, memwrite, jump, regvalue, undefined, aluop} = controls;
   
  always_comb
    case(op)
      6'b000000:case(funct)  // R Instructions
        6'b000000: controls <= 23'b0000x100101x00000001000;//sll
        6'b000010: controls <= 23'b0000x100101x00000001010; // srl
        6'b000011: controls <= 23'b0000x000101x00000001011; // sra
        6'b000100: controls <= 23'b0000x000101x00000001000; // sllv
        6'b000110: controls <= 23'b0000x000101x00000001010; // srlv
        6'b000111: controls <= 23'b0000x000101x00000001011; // srav
        6'b001000: controls <= 23'b00001xx00xxx001xxx0xxxx; // jr
        6'b001001: controls <= 23'b00001xx0110x0011010xxxx; // jalr
        6'b011001: controls <= 23'b0000x0000xxx000xxx01111; // multu
        6'b100000: controls <= 23'b0000x001101x00000000000; // add
        6'b100001: controls <= 23'b0000x000101x00000000000; // addu
        6'b100010: controls <= 23'b0000x001101x00000000001; // sub
        6'b100011: controls <= 23'b0000x000101x00000000001; // subu
        6'b100100: controls <= 23'b0000x000101x00000000100; // and
        6'b100101: controls <= 23'b0000x000101x00000000101; // or
        6'b100110: controls <= 23'b0000x000101x00000000110; // xor
        6'b100111: controls <= 23'b0000x000101x00000000111; // nor
        6'b101010: controls <= 23'b0000x001101x00000100001; // slt
        6'b101011: controls <= 23'b0000x000101x00000100001; // sltu
        default:   controls <= 23'b0000000000000000001xxxx; // undefined instruction
      endcase
      6'b000100: controls <= 23'b1000x0000xxx000xxx00001;  // beq
      6'b000101: controls <= 23'b0100x0000xxx000xxx00001;  // bne
      6'b000110: controls <= 23'b0010x0000xxx000xxx00001;  // bgt
      6'b000111: controls <= 23'b0001x0000xxx000xxx00001;  // bl
      6'b001000: controls <= 23'b0000x011100x00000000000;  // addi
      6'b001001: controls <= 23'b0000x010100x00000000000;  // addiu
      6'b001010: controls <= 23'b0000x011100x00000100001;  // slti
      6'b001011: controls <= 23'b0000x010100x00000100001;  // sltiu
      6'b001100: controls <= 23'b0000x010100x00000000100;  // andi
      6'b001101: controls <= 23'b0000x010100x00000000101;  // ori
      6'b001110: controls <= 23'b0000x010100x00000000110;  // xori
      6'b001111: controls <= 23'b0000x000100x0001100xxxx;  // lui
      6'b011100: controls <= 23'b0000x000101x00000001111;  // mul
      6'b100000: controls <= 23'b0000x011100000001100000;  // lb
      6'b100001: controls <= 23'b0000x011100000010000000;  // lh
      6'b100011: controls <= 23'b0000x011100000001000000;  // lw
      6'b100100: controls <= 23'b0000x011100100001100000;  // lbu
      6'b100101: controls <= 23'b0000x011100100010000000;  // lhu
      6'b101000: controls <= 23'b0000x0110xxx100xxx00000;  // sb
      6'b101001: controls <= 23'b0000x0110xxx110xxx00000;  // sh
      6'b101011: controls <= 23'b0000x0110xxx010xxx00000;  // sw
      6'b010000: controls <= 23'b0000x000100x0001110xxxx;  // mfc0
      6'b000010: controls <= 23'b00000xx00xxx001xxx0xxxx;  // j
      6'b000011: controls <= 23'b00000xx0110x0011010xxxx;  // jal
      default:   controls <= 23'b0000000000000000001xxxx;  // undefined instruction
    endcase
    
endmodule