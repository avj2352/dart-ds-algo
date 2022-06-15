/**
* Contains list of useful test functions
*/
String assertify(dynamic actual, dynamic expected) {
  if (actual == expected)
    return 'PASS';
  else
    return 'FAIL!...${actual} != ${expected}';
}
