import Std.Diagnostics.*;

operation Main() : Result {
    use q = Qubit();
    Message("Initialized Qubit");

    DumpMachine(); //Fist Dump
    Message(" ");
    H(q);
    Message("Qubit after applying 'H'");
    DumpMachine(); //Second Dump
    Message(" ");

    let randomBit = M(q);
    Message("Qubit after the measurement:");
    DumpMachine(); //Third Dump
    Message(" ");
    Reset(q);
    Message("Qubit after resetting");
    DumpMachine();
    Message(" ");
    return randomBit;
}