/*
 41. 缺失的第一个正数
 给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

 请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。

 示例 1：

 输入：nums = [1,2,0]
 输出：3
 示例 2：

 输入：nums = [3,4,-1,1]
 输出：2
 示例 3：

 输入：nums = [7,8,9,11,12]
 输出：1

 提示：

 1 <= nums.length <= 5 * 105
 -231 <= nums[i] <= 231 - 1

 */

/*
 思路:
    1.数组长度为n，最小正整数肯定是在[1, n + 1]区间内
    2.可以以原数组空间为一个Hashmap做记录, key为数组的Index,用数的正负性代表数是否出现过
    3.如果对应的index在数组中已存在就标记为负数
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    let n = nums.count
    var _nums = nums

    // 负数是无效数字用最大值取代方便标记
    for num in nums {
        if num < 0 {
            _nums = n + 1
        }
    }

    // 以数组的index去记录 [1, 1 + n]区间的数是否在数组中出现过，如果出现过把对应index的值标记为负的
    for i in 0 ..< n {
        let num = abs(_nums[i])
        if num <= n {
            _nums[num - 1] = -abs(_nums[num - 1])
        }
    }

    for i in 0 ..< n {
        if _nums[i] > 0 {
            return i + 1
        }
    }

    return n + 1
}

// let nums = [3, 4, -1, 1]
// print("result:", firstMissingPositive(nums))

/*
 思路:

     nums = [6, 7, 8]    n     target = 5

     [target + 1, target + 1 + n]

 */

// func minMissingPositive(_ nums: [Int], _ target: Int) -> Int {

// }
