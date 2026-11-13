`timescale 1ns/1ps

module tb_decoders;

    reg  [7:0] ch;
    reg        num_mode;
    wire [5:0] pat;
    wire       v1, isd;
    wire [7:0] back;
    wire       isns, v2;

    ascii_to_braille U1 (ch, pat, v1, isd);
    braille_to_ascii U2 (pat, num_mode, back, isns, v2);

    initial begin
        $monitor("ch=%c | pat=%b | back=%c | v1=%b v2=%b isd=%b",
                 ch, pat, back, v1, v2, isd);

        // Letras (num_mode = 0)
        num_mode = 1'b0;
        ch = "a"; #10;
        ch = "b"; #10;
        ch = "c"; #10;
        ch = "d"; #10;
        ch = "e"; #10;
        ch = "f"; #10;
        ch = "g"; #10;
        ch = "h"; #10;
        ch = "i"; #10;
        ch = "j"; #10;
        ch = "k"; #10;
        ch = "l"; #10;
        ch = "m"; #10;
        ch = "n"; #10;
        ch = "o"; #10;
        ch = "p"; #10;
        ch = "q"; #10;
        ch = "r"; #10;
        ch = "s"; #10;
        ch = "t"; #10;
        ch = "u"; #10;
        ch = "v"; #10;
        ch = "w"; #10;
        ch = "x"; #10;
        ch = "y"; #10;
        ch = "z"; #10;
        ch = " "; #10;

        // Digitos (num_mode = 1)
        num_mode = 1'b1;
        ch = "0"; #10;
        ch = "1"; #10;
        ch = "2"; #10;
        ch = "3"; #10;
        ch = "4"; #10;
        ch = "5"; #10;
        ch = "6"; #10;
        ch = "7"; #10;
        ch = "8"; #10;
        ch = "9"; #10;

        // No soportados (v1 debe valer 0)
        num_mode = 1'b0;
        ch = "A"; #10;
        ch = "!"; #10;

        $finish;
    end

endmodule
