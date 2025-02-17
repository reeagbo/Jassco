include ("io.asc")
//include ("math.asc")

function sum(num0) {
    if (num0 <= 0) return 0; // Base case
    return num0 + sum(num0 - 1); // Recursive case
}

console.log ("Sumatory of 10 is (55)= ", sum(10));
