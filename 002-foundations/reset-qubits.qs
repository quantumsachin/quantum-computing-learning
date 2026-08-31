operation Main() : Result {
    use q = Qubit();
    let result = M(q);

    // Reset the qubit so that you can release it
    Reset(q);
    return result;
}