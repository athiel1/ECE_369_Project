module Branch(Branch, Zero, PCSrc);

  input Branch;
  input Zero;

  output PCSrc;

  if (Branch and Zero) begin
    assign PCSrc = 1;
  end

  else begin
    assign PCSrc = 0;
  end

endmodule
