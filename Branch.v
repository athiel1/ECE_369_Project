module Branch(Branch, Zero, PCSrc);

  input Branch;
  input Zero;

  output PCSrc;

  assign PCSrc = Branch & Zero;

endmodule
