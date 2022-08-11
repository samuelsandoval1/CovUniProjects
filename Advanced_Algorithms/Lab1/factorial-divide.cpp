#include <iostream>
#include <math.h>
#include <string>

using namespace std;

/*
For this task, we want to know whether the factorial of an integer n can be divided by another integer
m. (Put mathematically, The factorial for a non-negative integer n, n!, is defined as: 0! = 1 n! = n * (n-
1)! (n > 0). Moreover, m divides n! if there exists an integer k such that k * m = n!.)
The input to your program will be two non-negative integers, n and m. (NB, make sure these inputs are
reasonably sensible. Factorials get enormous fast. See below.) For each input, output a line stating
whether or not n! divides by m

Ex. 
Input: 6, 9
Output: YES. 6! divides by 9

Input: 6, 27
Output: NO. 6! does not divide by 27


*/


string factorialDivide(int n, int n2){
    double factorialNum = 1.0;
    for(int i = 1; i <= n; i++){
        factorialNum *= i;
    }
    if(fmod(factorialNum, double(n)) == 0){
        return "YES. " + to_string(n) + "! does divide by " + to_string(n2);
    }
    
    return "No. " + to_string(n) + "! does not divide by " + to_string(n2);
}

int main(){
    string result = factorialDivide(6, 9);
    cout << result << endl;
    string result2 = factorialDivide(6, 27);
    cout << result2 << endl;
    string result3 = factorialDivide(20, 10000);
    cout << result3 << endl;
}