module Branch(Branch, Zero, PCSrc);

  input Branch;
  input Zero;

  output PCSrc;

  if (Branch and Zero) begin
    PCSrc = 1;
  end

  else begin
    PCSrc = 0;
  end

endmodule
