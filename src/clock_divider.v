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
                slow_clk <= ~slow_clk; // 1Hz output (for 50MHz input)
            end
        end
    end
endmodule
