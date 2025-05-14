// Simulated includes (placeholders for your environment)
include("io.asc");
include("math.asc");

// Input layer
var nr_input_cases = 1
var input_cases = [[1,1], [0,0]];
//var input_cases = [[0,0], [0,1], [1,0], [1,1]];
var nr_neurons0 = 2

// Hidden layer
var nr_neurons1 = 2
var weights1 = [
				[ 1,  1], 
				[-2, -2]
						];
var biases1 = 	[ 0,  3];
var outputs1 = 	[ 0,  0];

// Output layer
var nr_neurons2 = 2
var weights2 = [
				[ 1,  1], 
				[-1, -1]
						];
var biases2 = 	[-1,  0];
var outputs2 = 	[ 0,  0];

var i = 0; var j = 0; var k = 0

// Simple step activation function: returns 1 if input > 0, else 0
function step (step_input) {
  var step_output=0
  step_output= step_input > 0 ? step_input : 0;
  return step_output
}

// relu activation function: returns input if input > 0, else 0
function relu (relu_input) {
  var relu_output = 0;
  relu_output = relu_input > 0 ? relu_input : 0;
  return relu_output;
}

// Neuron network
function run_network(index) {
	var neuron_sum = 0;

	// --- Hidden Layer: Compute outputs1 ---
	for (j = 0; j < nr_neurons1; j++) { // each hidden neuron
		neuron_sum = 0;
		
	    for (k = 0; k < nr_neurons0; k++) { // each input
	      neuron_sum += weights1[j][k] * input_cases[index][k];
	    }
	    neuron_sum += biases1[j];
	    outputs1[j] = relu(neuron_sum);
		console.log ("L1, N", j, ": ", outputs1[j])
	}

	// --- Output Layer: Compute outputs2 ---
	for (j = 0; j < nr_neurons2; j++) { // each output neuron
	    neuron_sum = 0;
	    for (k = 0; k < nr_neurons1; k++) { // each input
	      neuron_sum += weights2[j][k] * outputs1[k];
	    }
	    neuron_sum += biases2[j];
	    outputs2[j] = relu(neuron_sum);
		console.log ("L2, N", j, ": ", outputs2[j])
	}
}

// Main Code ------------------------------------------------------------------
for (i = 0; i < nr_input_cases ; i++) {
	// Inputs
	console.log ("* Input ", i)
 	for (j = 0; j < nr_neurons0; j++) {
		console.lognumber (input_cases[i][j]);
		console.logchar (",")
		}
	console.log ("")

	// Run network
	run_network(i)
	
	// Outputs
	console.log ("Output:")
	for (j = 0; j < nr_neurons2; j++) {
		console.lognumber (outputs2[j]);
		console.logchar (",")
	}
	console.log ("")
}

