module uart_rx(
    input clk,
    input rst,
    input rx,

    output reg [7:0] rx_data,
    output reg rx_done
);

reg [3:0] bit_count;
reg [7:0] data_buffer;
reg receiving;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        rx_data <= 0;
        rx_done <= 0;
        bit_count <= 0;
        receiving <= 0;
    end

    else
    begin

        rx_done <= 0;

        // Detect start bit
        if(!receiving && rx == 0)
        begin
            receiving <= 1;
            bit_count <= 0;
        end

        else if(receiving)
        begin

            if(bit_count < 8)
            begin
                data_buffer[bit_count] <= rx;
                bit_count <= bit_count + 1;
            end
            else
            begin
                rx_data <= data_buffer;
                rx_done <= 1;
                receiving <= 0;
            end

        end
    end
end

endmodule