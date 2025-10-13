// ==================================================
// Module: clock_divider
// Function: Divide 50MHz clock to 1Hz output
// ==================================================
module clock_divider(
    input wire clk,
    input wire rst,
    output reg slow_clk
);
    reg [25:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            slow_clk <= 0;
        end else begin
            count <= count + 1;
            if (count == 25_000_000) begin
                count <= 0;
                slow_clk <= ~slow_clk;  // Toggle every 0.5s → 1Hz
            end
        end
    end
endmodule
