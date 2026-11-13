module braille_to_ascii (
    input  wire [5:0] braille,
    input  wire       num_mode,     // 1 = viene después de un signo de número
    output reg  [7:0] ascii,
    output reg        is_num_sign,  // 1 = es el signo de número (no es carácter)
    output reg        valid         // 1 = hay un carácter que transmitir
);
    always @(*) begin
        ascii       = 8'h00;
        is_num_sign = 1'b0;
        case (braille)
            6'b000000: ascii = " ";
            6'b111100: is_num_sign = 1'b1;
            6'b000001: ascii = num_mode ? "1" : "a";
            6'b000011: ascii = num_mode ? "2" : "b";
            6'b001001: ascii = num_mode ? "3" : "c";
            6'b011001: ascii = num_mode ? "4" : "d";
            6'b010001: ascii = num_mode ? "5" : "e";
            6'b001011: ascii = num_mode ? "6" : "f";
            6'b011011: ascii = num_mode ? "7" : "g";
            6'b010011: ascii = num_mode ? "8" : "h";
            6'b001010: ascii = num_mode ? "9" : "i";
            6'b011010: ascii = num_mode ? "0" : "j";
            6'b000101: ascii = "k";
            6'b000111: ascii = "l";
            6'b001101: ascii = "m";
            6'b011101: ascii = "n";
            6'b010101: ascii = "o";
            6'b001111: ascii = "p";
            6'b011111: ascii = "q";
            6'b010111: ascii = "r";
            6'b001110: ascii = "s";
            6'b011110: ascii = "t";
            6'b100101: ascii = "u";
            6'b100111: ascii = "v";
            6'b111010: ascii = "w";
            6'b101101: ascii = "x";
            6'b111101: ascii = "y";
            6'b110101: ascii = "z";
            default:   ascii = 8'h00;
        endcase
        valid = (ascii != 8'h00);
    end
endmodule
