// madLib
// Write a function that takes three strings - a verb, an adjective,
// and a noun - uppercases and interpolates them into the sentence "We
// shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
//
// For example,
//
// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function madLib(verb, adjective, noun) {
  return `We shall ${verb} the ${adjective} ${noun}`;
}

console.log(madLib("eat", "delicious", "pastrami"));
console.log(madLib("attack", "evil", "gazebo"));

// isSubstring
// Input
//
// A String, called searchString.
// A String, called subString.
// Output: A Boolean. true if the subString is a part of the searchString.
//
// > isSubstring("time to program", "time")
// true
//
// > isSubstring("Jump for joy", "joys")
// false

function isSubstring(searchString, subString) {
  if (searchString.indexOf(subString) === -1) {
    return false;
  } else {
    return true;
  }
}

console.log(isSubstring("catastrophe", "cat"));
console.log(isSubstring("team", "i"));

// fizzBuzz
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array and returns a
// new array of every number in the array that is divisible by either
// 3 or 5, but not both.

function fizzBuzz(array) {
  let newArray = [];

  array.forEach(function(el) {
    if (el % 3 === 0 || el % 5 === 0) {
      newArray.push(el);
    }
  });
  return newArray;
}

console.log(fizzBuzz([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]));

// isPrime
// Define a function isPrime(number) that returns true if number is
// prime. Otherwise, false. Assume number is a positive integer.
//
// > isPrime(2)
// true
//
// > isPrime(10)
// false
//
// > isPrime(15485863)
// true
//
// > isPrime(3548563)
// false

function isPrime(number) {


  // get range of numbers
  let array  = [];
  for (let i = 2; i < number; i++) {
    array.push(i);
  }

  //boolean to track whether prime-ness is disproven
  let numIsPrime = true;
  if (number === 1) {
    numIsPrime = false;
  }

  //iterate through numbers
  array.forEach(function(el) {
    if (number % el === 0) {
      numIsPrime = false;
    }
  });
  return numIsPrime;
}

console.log(isPrime(9));
console.log(isPrime(7));
console.log(isPrime(13));
console.log(isPrime(14));
console.log(isPrime(1));

// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the
// sum of the first n prime numbers. Hint: use isPrime as a helper method.
//
// > sumOfNPrimes(0)
// 0
//
// > sumOfNPrimes(1)
// 2
//
// > sumOfNPrimes(4)
// 17

function sumOfNPrimes(n) {

  let primes = [];
  let i = 1;

  while (primes.length < n) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i += 1;
  }

  let sumOfPrimes = 0;
  primes.forEach(function(el) {
    sumOfPrimes += el;
  });

  return sumOfPrimes;
}

console.log(sumOfNPrimes(3));
console.log(sumOfNPrimes(10));
console.log(sumOfNPrimes(17));
