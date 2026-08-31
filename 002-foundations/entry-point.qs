// The @EntryPoint() attribute tells the compiler to start running your code from this operation
@EntryPoint()
operation MeasureOneQubit() : Result {
    use q = Qubit();
    return M(q);
}