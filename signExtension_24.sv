module signExtension(input logic[15:0] a, input logic s, output logic[31:0] y);
  assign y = {{24{s}}, a};
endmodule

