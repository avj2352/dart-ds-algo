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
