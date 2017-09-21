module rotateUnit(input logic[31:0] a, input logic[1:0] s, output logic[31:0] y, output logic c_out);
  always_comb
  case(s)
    0: 
    begin
      y = {a[30:0], a[31]}; 
      c_out = a[31];
    end
    1: 
    begin
      y = {a[29:0], a[31:30]};
      c_out = a[30];
    end
    2:
    begin
      y = {a[0], a[31:1]};
      c_out = a[0];
    end
    3:
    begin
      y = {a[1:0], a[31:2]};
      c_out = a[1];
    end
  endcase
endmodule


