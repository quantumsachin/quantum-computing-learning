# Install this 
python -m pip install --upgrade "qdk[jupyter]"


Open VS Code.
Open the View menu and then choose Command Palette. An input box appears.
In the input box, enter and choose Create: New Jupyter Notebook.
In the notebook's first cell, import the qsharp package and the EstimateDetails function:


import qsharp
from qsharp_widgets import EstimateDetails


%%qsharp
/// # sample
/// Random Bit
///
/// # Description
/// This Q# program generates a random bit by setting a qubit in a superposition
/// of the computational basis states |0> and |1>, and returning the measurement result.

operation RandomBit() : Result {
    use qubit = Qubit();
    H(qubit);

    let result = M(qubit);
    Reset(qubit);
    return result;
}

result = qsharp.estimate("RandomBit()")
EstimateDetails(result)


result['jobParams']



result_maj = qsharp.estimate("RandomBit()", params={
                "qubitParams": {
                    "name": "qubit_maj_ns_e6"
                }})

EstimateDetails(result_maj)



result_maj = qsharp.estimate("RandomBit()", params={
                "qubitParams": {
                    "name": "qubit_maj_ns_e6"
                },
                "qecScheme": {
                    "name": "floquet_code"
                }})

EstimateDetails(result_maj)




result_maj = qsharp.estimate("RandomBit()", params={
                "qubitParams": {
                    "name": "qubit_maj_ns_e6"
                },
                "qecScheme": {
                    "name": "floquet_code"
                },
                "errorBudget": 0.1})

EstimateDetails(result_maj)