import 'package:dart_ds_algo/util/test_util.dart' as util;
import 'dart:math';

/*
* Minimum Change
* Structy.net https://d22skcv5wmogjc.cloudfront.net/#/details/6239cbe593567b0016fdbc88
* Dynamic Programming + Recursion + DFS
* Space Time complexity
* Time: O(n)
* Space: O(n) -> because of memoization
*/
void exec() {
  print('test_01: ${util.assertify(minChange(8, [1, 5, 4, 12]), 2)}');
}

int minChange(int amount, List<int> coins) {
  Map<int, double> memo = new Map<int, double>();
  if (dfs(amount, coins, memo) == double.infinity)
    return -1;
  else
    return dfs(amount, coins, memo).toInt();
}

double dfs(int amount, List<int> coins, Map<int, double> memo) {
  // memo check
  if (memo.containsKey(amount)) return memo[amount]!;
  // base case
  if (amount == 0) return 0.0;
  if (amount < 0) return double.infinity;
  // intialize
  double minVal = double.infinity;
  // for loop
  coins.forEach((coin) {
    double numCoins = 1 + dfs(amount - coin, coins, memo);
    minVal = min(minVal, numCoins);
  });
  // return
  memo[amount] = minVal;
  return minVal;
}
