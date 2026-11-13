module ascii_to_braille (
    input  wire [7:0] ascii,
    output reg  [5:0] braille,   // bit0 = punto 1 ... bit5 = punto 6
    output reg        valid,     // 1 = carácter soportado
    output wire       is_digit   // 1 = '0'..'9' (la FSM debe anteponer el signo de número)
);
    assign is_digit = (ascii >= "0") && (ascii <= "9");

    always @(*) begin
        valid   = 1'b1;
        braille = 6'b000000;
        case (ascii)
            " ":      braille = 6'b000000;
            "a", "1": braille = 6'b000001;
            "b", "2": braille = 6'b000011;
            "c", "3": braille = 6'b001001;
            "d", "4": braille = 6'b011001;
            "e", "5": braille = 6'b010001;
            "f", "6": braille = 6'b001011;
            "g", "7": braille = 6'b011011;
            "h", "8": braille = 6'b010011;
            "i", "9": braille = 6'b001010;
            "j", "0": braille = 6'b011010;
            "k": braille = 6'b000101;
            "l": braille = 6'b000111;
            "m": braille = 6'b001101;
            "n": braille = 6'b011101;
            "o": braille = 6'b010101;
            "p": braille = 6'b001111;
            "q": braille = 6'b011111;
            "r": braille = 6'b010111;
            "s": braille = 6'b001110;
            "t": braille = 6'b011110;
            "u": braille = 6'b100101;
            "v": braille = 6'b100111;
            "w": braille = 6'b111010;
            "x": braille = 6'b101101;
            "y": braille = 6'b111101;
            "z": braille = 6'b110101;
            default: valid = 1'b0;
        endcase
    end
endmodule
