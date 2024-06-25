import 'dart:math';

class QuestionGenerate{
  final int symbol;
  final int hard;
  Random rm = Random();
  QuestionGenerate({required this.symbol, required this.hard});
  // Symbol
  // 1 -> +
  // 2 -> -
  // 3 -> *
  // 4 -> /
  // 5 -> Root
  // 6 -> Mix
  

  // Hard
  // 1 -> easy
  // 2 -> medium
  // 3 -> hard

  Map<String, int> generate() {
    if (symbol == 1) {
      return addition();
    } else if (symbol == 2) {
      return subtraction();
    } else if (symbol == 3) {
      return multiplication();
    } else if (symbol == 4) {
      return division();
    } else if (symbol == 5) {
      return root();
    } else if (symbol == 6) {
      return {};
    }
    // Return an empty map if the symbol is not recognized
    return {};
  }


  Map<String, int> addition(){
    int num1, num2, ans;
    if(hard==1){
      num1 = generateRandomNumber(1, 99);
      num2 = generateRandomNumber(1, 99);
      ans = num1+num2;
    }else if(hard==2){
      num1 = generateRandomNumber(100, 999);
      num2 = generateRandomNumber(100, 999);
      ans = num1+num2;
    }else{
      num1 = generateRandomNumber(1000, 10000);
      num2 = generateRandomNumber(1000, 10000);
      ans = num1+num2;
    }
    return {
      'num1': num1,
      'num2': num2,
      'ans': ans
    };
  }
  
  Map<String, int> subtraction(){
    int num1, num2, ans;
    if(hard==1){
      num1 = generateRandomNumber(1, 99);
      num2 = generateRandomNumber(1, num1);
      ans = num1-num2;
    }else if(hard==2){
      num1 = generateRandomNumber(100, 9999);
      num2 = generateRandomNumber(100, num1);
      ans = num1-num2;
    }else{
      num1 = generateRandomNumber(10000, 100000);
      num2 = generateRandomNumber(1000, num1);
      ans = num1-num2;
    }
    return {
      'num1': num1,
      'num2': num2,
      'ans': ans
    };
  }

  Map<String, int> multiplication(){
    int num1, num2, ans;
    if(hard==1){
      num1 = generateRandomNumber(1, 10);
      num2 = generateRandomNumber(1, 10);
      ans = num1 * num2;
    }else if(hard==2){
      num1 = generateRandomNumber(10, 99);
      num2 = generateRandomNumber(10, 99);
      ans = num1 * num2;
    }else{
      num1 = generateRandomNumber(100, 999);
      num2 = generateRandomNumber(100, 999);
      ans = num1 * num2;
    }
    return {
      'num1': num1,
      'num2': num2,
      'ans': ans
    };
  }


  Map<String, int> division(){
    int numerator, denominator, ans;
    if(hard==1){
      denominator = generateRandomNumber(2, 11); // Ensuring num2 is between 2 and 10
      ans = generateRandomNumber(2, 101); // Random answer between 1 and 10
    } else if(hard==2){
      denominator = generateRandomNumber(11, 22); // Ensuring num2 is between 11 and 22
      ans = generateRandomNumber(15, 101); // Random answer between 1 and 10
    } else {
      denominator = generateRandomNumber(101, 9999); // Ensuring num2 is between 100 and 999
      ans = generateRandomNumber(10, 1001); // Random answer between 1 and 10
    }
    numerator = ans * denominator; // Calculating the numerator
    return {
      'num1': numerator,
      'num2': denominator,
      'ans': ans
    };
  }



  Map<String, int> root(){
    var squareOfNum = 0;
    var rootOfSquareOfNum = 0;
    final rootMapping = {
      1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81, 10: 100,
      11: 121, 12: 144, 13: 169, 14: 196, 15: 225, 16: 256, 17: 289, 18: 324, 19: 361, 20: 400,
      21: 441, 22: 484, 23: 529, 24: 576, 25: 625, 26: 676, 27: 729, 28: 784, 29: 841, 30: 900,
      31: 961, 32: 1024, 33: 1089, 34: 1156, 35: 1225, 36: 1296, 37: 1369, 38: 1444, 39: 1521, 40: 1600
    };

    if(hard == 1){
      rootOfSquareOfNum = generateRandomNumber(1, 10);
    } else if(hard == 2){
      rootOfSquareOfNum = generateRandomNumber(11, 20);
    } else {
      rootOfSquareOfNum = generateRandomNumber(21, 40);
    }
    squareOfNum = rootMapping[rootOfSquareOfNum]!;
    return {
      'num': squareOfNum,
      'ans': rootOfSquareOfNum
    };
  }


  void mixed(){
    if(hard==1){

    }else if(hard==2){

    }else{

    }
  }

  int generateRandomNumber(int min, int max) {
    return min + rm.nextInt(max - min + 1);
  }
}