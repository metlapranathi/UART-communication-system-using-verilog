module uart_tx(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,

    output reg tx,
    output reg tx_busy
);

reg [3:0] bit_count;
reg [9:0] shift_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx <= 1'b1;
        tx_busy <= 0;
        bit_count <= 0;
        shift_reg <= 10'h3FF;
    end
    else
    begin

        if(tx_start && !tx_busy)
        begin
            // stop bit + data + start bit
            shift_reg <= {1'b1, tx_data, 1'b0};
            tx_busy <= 1;
            bit_count <= 0;
        end

        else if(tx_busy)
        begin
            tx <= shift_reg[0];
            shift_reg <= shift_reg >> 1;
            bit_count <= bit_count + 1;

            if(bit_count == 9)
            begin
                tx_busy <= 0;
                tx <= 1'b1;
            end
        end
    end
end

endmodule