`timescale 1ns/1ps

module tb_num;

    reg        clk, rst_n;
    reg  [5:0] braille;
    reg        new_pattern;
    reg        num_mode;
    wire [7:0] ascii;
    wire       is_num_sign, valid;

    braille_to_ascii DUT (braille, num_mode, ascii, is_num_sign, valid);

    // Reloj de 50 MHz
    always #10 clk = ~clk;

    // Este bloque es el que va en la FSM
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            num_mode <= 1'b0;
        else if (new_pattern) begin
            if (is_num_sign)          num_mode <= 1'b1;
            else if (braille == 6'b0) num_mode <= 1'b0;
        end
    end

    initial begin
        $monitor("braille=%b | num_mode=%b | ascii=%c | valid=%b | signo=%b",
                 braille, num_mode, ascii, valid, is_num_sign);

        clk = 0; rst_n = 0; braille = 6'b000000; new_pattern = 0;
        #25 rst_n = 1;

        braille = 6'b010011; new_pattern = 1; #20; new_pattern = 0; #20; // h
        braille = 6'b010101; new_pattern = 1; #20; new_pattern = 0; #20; // o
        braille = 6'b000111; new_pattern = 1; #20; new_pattern = 0; #20; // l
        braille = 6'b000001; new_pattern = 1; #20; new_pattern = 0; #20; // a
        braille = 6'b000000; new_pattern = 1; #20; new_pattern = 0; #20; // espacio
        braille = 6'b111100; new_pattern = 1; #20; new_pattern = 0; #20; // signo de numero
        braille = 6'b000001; new_pattern = 1; #20; new_pattern = 0; #20; // 1
        braille = 6'b000011; new_pattern = 1; #20; new_pattern = 0; #20; // 2
        braille = 6'b000000; new_pattern = 1; #20; new_pattern = 0; #20; // espacio (termina el numero)
        braille = 6'b000001; new_pattern = 1; #20; new_pattern = 0; #20; // a
        braille = 6'b000011; new_pattern = 1; #20; new_pattern = 0; #20; // b

        $finish;
    end

endmodule
