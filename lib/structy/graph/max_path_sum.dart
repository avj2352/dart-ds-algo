import 'package:dart_ds_algo/util/test_util.dart' as util;
import 'dart:math';

/*
 * Max Path Sum
 * Structy.net - https://d22skcv5wmogjc.cloudfront.net/#/details/623efdc415620f00164cf440
 * DFS + Recursion + Memoization
 * Space Time Complexity
 * Time: O(rc)
 * Space: O(rC)
 */
void exec() {
  List<List<int>> test01 = [
    [1, 3, 12],
    [5, 1, 1],
    [3, 6, 1]
  ]; // 18
  List<List<int>> test02 = [
    [1, 2, 8, 1],
    [3, 1, 12, 10],
    [4, 0, 6, 3]
  ]; // 36
  List<List<int>> test03 = [
    [1, 2, 8, 1],
    [3, 10, 12, 10],
    [4, 0, 6, 3]
  ]; // 39
  print('test_01: ${util.assertify(maxPathSum(test01), 18)}');
  print('test_02: ${util.assertify(maxPathSum(test02), 36)}');
  print('test_03: ${util.assertify(maxPathSum(test03), 39)}');
}

int maxPathSum(List<List<int>> grid) {
  Map<String, int> memo = new Map<String, int>();
  return dfs(grid, memo);
}

// recursive
int dfs(List<List<int>> grid, Map<String, int> memo, [int r = 0, int c = 0]) {
  // memo check
  String pos = '${r},${c}';
  if (memo.containsKey(pos)) return memo[pos]!;
  // bounds check
  if (r == grid.length || c == grid[0].length) return 0;
  // base case
  if (r == grid.length && c == grid[0].length) return grid[r][c];
  // recursive case
  int down = dfs(grid, memo, r + 1, c);
  int right = dfs(grid, memo, r, c + 1);
  memo[pos] = grid[r][c] + max(down, right);
  return memo[pos]!;
}
