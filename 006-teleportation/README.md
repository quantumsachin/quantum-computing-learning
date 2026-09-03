## Steps
1. Create an alice qubit. We now have the three qubits that we need to perform quantum teleportation: alice, bob, and message.

2. Entangle the alice and bob qubits. We do this in the usual way: apply a Hadamard gate to put the alice qubit into a superposition state.

3. Encode the message qubit into the entangled pair of alice and bob qubits. To do this, we apply a CNOT gate with message as the control qubit and alice as the target qubit. The alice and message qubit states are now in the Bell basis.

4. Transform the Bell states into computational states. We do this because, in Q#, we can't perform measurements directly on Bell states. Apply a Hadamard gate to the message qubit to transform the states into the computational basis.

5. Measure the alice and message qubits, and apply the appropriate gates to the bob qubit based on the measurement results. First, use the M operation to measure message. If the result is 1, then apply the gate to bob. Next, measure alice with the M operation. If the result is 1, then apply the gate to bob.