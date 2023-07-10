`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

// testbench is controlled by test.py
module tb ();

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [6:0] segments = uo_out[6:0];
    wire [7:0] uo_out;
    wire [7:0] ui_in;
    wire [7:0] uio_out;
    wire [7:0] uio_in;
    wire [7:0] uio_oe;
    wire clk;
    wire rst_n;
    wire ena;

    // instantiate the DUT with lower MAX_COUNT for a faster sim
    // tt_um_seven_segment_seconds #(.MAX_COUNT(1000)) tt_um_seven_segment_seconds (
    //     `ifdef GL_TEST
    //         .vccd1( 1'b1),
    //         .vssd1( 1'b0),
    //     `endif
    //     .ui_in      (ui_in),    // Dedicated inputs
    //     .uo_out     (uo_out),   // Dedicated outputs
    //     .uio_in     (uio_in),   // IOs: Input path
    //     .uio_out    (uio_out),  // IOs: Output path
    //     .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
    //     .ena        (ena),      // enable - goes high when design is selected
    //     .clk        (clk),      // clock
    //     .rst_n      (rst_n)     // not reset
    //     );

endmodule
