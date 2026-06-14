`timescale 1ns/1ps

module tb_uart_loopback;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire serial_line;
wire tx_busy;

wire [7:0] rx_data;
wire rx_done;

// TX
uart_tx TX(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(serial_line),
    .tx_busy(tx_busy)
);

// RX
uart_rx RX(
    .clk(clk),
    .rst(rst),
    .rx(serial_line),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

// Clock
always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 0;

    #20;
    rst = 0;

    // Send 55h
    #10;
    tx_data = 8'h55;
    tx_start = 1;

    #10;
    tx_start = 0;

    wait(rx_done);

    $display("Transmitted = %h", tx_data);
    $display("Received    = %h", rx_data);

    if(rx_data == tx_data)
        $display("PASS");
    else
        $display("FAIL");

    #20;
    $finish;

end

endmodule