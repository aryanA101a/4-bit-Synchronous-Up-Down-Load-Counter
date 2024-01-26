module counter(
    input up_down,
    clk,
    rst,
    enable,
    load,
    input [3:0] in,
    output reg [3:0] out
);
initial begin
out=0;
end

always @(rst) 
    if(enable)
        out=0;

always @(negedge clk ) 
   if(enable)
        if(rst)
            out=0;
        else if(load)
            out<=in;
        else
            if(up_down)
                out<=out+1;
            else
                out<=out-1;
        
endmodule
