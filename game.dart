
void main() {
  print(myAtoi("42"));            // 42
  print(myAtoi("   -042"));       // -42
  print(myAtoi("1337c0d3"));      // 1337
  print(myAtoi("0-1"));           // 0
  print(myAtoi("words and 987")); // 0
}
int myAtoi(String s) {
  int i = 0;
  int n = s.length;
  // Step 1: Ignore leading whitespace
  while (i < n && s[i] == ' ') {
    i++;
  }

  // Step 2: Handle optional sign
  int sign = 1;
  if (i < n && (s[i] == '+' || s[i] == '-')) {
    if (s[i] == '-') {
      sign = -1;
    }
    i++;
  }

  // Step 3: Read digits
  int result = 0;
  while (i < n && s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) && s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
    int digit = s[i].codeUnitAt(0) - '0'.codeUnitAt(0);
    result = result * 10 + digit;
    i++;
  }

  // Step 4: Apply sign
  result *= sign;

  // Step 5: Clamp to 32-bit signed integer range
  const int INT_MIN = -2147483648;
  const int INT_MAX = 2147483647;

  if (result < INT_MIN) {
    return INT_MIN;
  }
  if (result > INT_MAX) {
    return INT_MAX;
  }

  return result;
}
