import Std.Convert.*;
import Std.Math.*;

operation Main() : Int {
    let max = 100;
    Message($"Generate a random number between 0 and {max}");

    return GenerateRandomNumberInRange(max);
}

/// Generate a random number between 0 and 'max'
operation GenerateRandomNumberInRange(max: Int) : Int {
    // Determine the number of bits needed to represent 'max' and store it
    // in the 'nBits' variable. Then generate 'nBits' random bits which will
    // represent the generated random number.
    mutable bits = [];
    let nBits = BitSizeI(max);
    for idxBit in 1..nBits {
        set bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);

    // Return random number if its within the requested range
    // Generate it again if it's outside the range.
    return sample > max ? GenerateRandomNumberInRange(max) | sample;
}

operation GenerateRandomBit() : Result {
    // Allocate a qubit.
    use q = Qubit();

    // Set the qubit in the superposition of 0 and 1 using the Hadamard.
    H(q);

    // Measure the qubit and store the result.
    let result = M(q);

    // Reset qubit to the |0> state.
    Reset(q);

    // Return the result of the measurement.
    return result;
    
}