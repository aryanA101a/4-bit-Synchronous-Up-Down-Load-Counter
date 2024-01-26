`include "fourBitSyncCounter.v"

module counter_tb;
    reg up_down,clk,rst,enable,load;
    reg [3:0] in;
    wire [3:0] out;

    counter ctr(up_down,clk,rst,enable,load,in,out);

    // Generate clock signal
    initial begin
        clk=1;
        forever #5 clk=~clk;
    end

    // Testcases
    initial begin
        $dumpfile("fourBitSyncCounter.vcd");
        $dumpvars(0,counter_tb);

        rst=0;
        enable=1;

        // CASE: Up count
        up_down=1;
        #155 
        
        // CASE: Down count
        up_down=0;
        #78
        
        // CASE: Reset
        rst=1;
        #15
        rst=0;

        // CASE: Toggle enable
        repeat(2) #20 enable=~enable;
        #20

        // CASE: Load
        in=5;
        load=1;
        #10
        load=0;
        #40

        $finish;

    end


endmodule

