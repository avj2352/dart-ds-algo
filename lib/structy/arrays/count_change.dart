import 'package:dart_ds_algo/util/test_util.dart' as util;

/**
* Counting Change
* Structy.net https://d22skcv5wmogjc.cloudfront.net/#/details/623f001a15620f00164cf86d
* Dynamic Programming + Recursion + Memoization
* Space Time Complexity
* Time: O(ec) -> where e is the number of elements in the array, c is the height of the tree
* Space: O(ec)
* https://stackoverflow.com/questions/69403241/flutterdart-cannot-remove-from-unmodifiable-list
* Maps with default values: Since your map is immutable you must create a new map 
* but don't make it an instance if the original just make a copy.
*/
void exec() {
  print('test_01: ${util.assertify(countingChange(4, [1, 2, 3]), 4)}');
  print('test_02: ${util.assertify(countingChange(8, [1, 2, 3]), 10)}');
  print('test_03: ${util.assertify(countingChange(24, [5, 7, 3]), 5)}');
  print('test_04: ${util.assertify(countingChange(13, [2, 6, 12, 10]), 0)}');
  print(
      'test_05: ${util.assertify(countingChange(512, [1, 5, 10, 25]), 20119)}');
  print('test_06: ${util.assertify(countingChange(1000, [
            1,
            5,
            10,
            25
          ]), 142511)}');
  print('test_07: ${util.assertify(countingChange(240, [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9
          ]), 1525987916)}');
}

int countingChange(int amount, List<int> coins,
    [int i = 0, Map memo = const <String, int>{}]) {
  // memo check
  Map<String, int> memoMap = Map.from(memo);
  String pos = '${amount},${i}';
  if (memoMap.containsKey(pos)) return memo[pos];
  // base case
  if (amount == 0) return 1;
  if (i >= coins.length) return 0;
  // recursive case
  int coin = coins[i];
  int sum = 0;
  for (int qty = 0; qty * coin <= amount; qty += 1) {
    int remainder = amount - qty * coin;
    sum += countingChange(remainder, coins, i + 1, memoMap);
  }
  // default
  memoMap[pos] = sum;
  return sum;
}
