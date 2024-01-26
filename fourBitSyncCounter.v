module counter(
    input up_down,
    clk,
    rst,
    enable,
    output reg [3:0] out
);
initial begin
out=0;
end

always @(posedge rst) 
    if(enable)
        out=0;

always @(negedge clk ) 
   if(enable)
        if(up_down)
            out<=out+1;
        else
            out<=out-1;
        
endmodule
