`timescale 1ns/1ps
module testbench;
    reg clk, rst;
    wire [2:0] led_out;
    wire [6:0] seg_out;

    // Instantiate top module
    top_module uut (
        .clk(clk),
        .rst(rst),
        .led_out(led_out),
        .seg_out(seg_out)
    );

    // Clock generation (50MHz)
    always #10 clk = ~clk;

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        rst = 1;
        #100;
        rst = 0;

        // Run for simulated 2 minutes
        #120000000;
        $finish;
    end
endmodule
