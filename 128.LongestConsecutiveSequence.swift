/**

 128. 最长连续序列
 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

 进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？

 示例 1：

 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 示例 2：

 输入：nums = [0,3,7,2,5,8,4,6,0,1]
 输出：9

 提示：

 0 <= nums.length <= 104
 -109 <= nums[i] <= 109

 */

func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.count <= 0 { return 0 }

    var set = Set<Int>()
    for n in nums {
        set.insert(n)
    }

    var result = 1
    for n in set {
        if set.contains(n - 1) { continue }
        var tmp = 1
        while set.contains(n + tmp) {
            tmp += 1
        }
        result = max(result, tmp)
    }

    return result
}

let tmp = [100, 4, 200, 1, 3, 2]
let result = longestConsecutive(tmp)
print(result)
