#include <stdio.h>

long gcd(long a, long b) {
  while (a != b) {
    if (a > b) {
      a = a - b;
    } else {
      b = b - a;
    }
  }

  return a;
}

int main(int argc, char ** argv) {
  long a = 90;
  long b = 800052312523;
  long result = gcd(a, b);
}
