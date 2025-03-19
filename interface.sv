interface mux_if(input bit clock);

    logic [7:0] in;
    logic [2:0] sel;
    logic out;

    clocking drv_cb @(posedge clock);
         default input #1 output #1;
            output in;
            output sel;
            input out;
    endclocking

    clocking mon_cb @(posedge clock);
      default input #1 output #1;
           input in;
           input sel;
           input out;
    endclocking

    modport DRV_MP (clocking drv_cb);
    modport MON_MP (clocking mon_cb);

endinterface
