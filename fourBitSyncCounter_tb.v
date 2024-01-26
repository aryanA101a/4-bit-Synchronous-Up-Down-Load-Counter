`include "fourBitSyncCounter.v"

module counter_tb;
    reg up_down,clk,rst,enable;
    wire [3:0] out;

    counter ctr(up_down,clk,rst,enable,out);

    // generate clock signal
    initial begin
        clk=1;
        forever #5 clk=~clk;
    end

    // testcases
    initial begin
        $dumpfile("fourBitSyncCounter.vcd");
        $dumpvars(0,counter_tb);


        up_down=1;
        rst=0;
        enable=1;

        #155 
        up_down=0;

        #80
        rst<=1;
        repeat(2) #20 rst<=~rst;


        #20
        repeat(3) #20 enable=~enable;
        

        $finish;

    end


endmodule

