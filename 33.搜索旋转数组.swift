/*

 33. 搜索旋转排序数组
 整数数组 nums 按升序排列，数组中的值 互不相同 。

 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

 示例 1：

 输入：nums = [4,5,6,7,0,1,2], target = 0
 输出：4
 示例 2：

 输入：nums = [4,5,6,7,0,1,2], target = 3
 输出：-1
 示例 3：

 输入：nums = [1], target = 0
 输出：-1

 提示：

 1 <= nums.length <= 5000
 -10^4 <= nums[i] <= 10^4
 nums 中的每个值都 独一无二
 题目数据保证 nums 在预先未知的某个下标上进行了旋转
 -10^4 <= target <= 10^4
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    var mid = 0
    var l = 0, r = nums.count - 1
    while l <= r {
        mid = (r - l) / 2 + l
        let n = nums[mid]
        if n == target {
            return mid
        } else if n > target {
            // n 在左边升序部门,说明target可以在左边也可以在右边
            if n >= nums[0] {
                // target在左边有序部分
                if target >= nums[0] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            // 在右边升序部分
            else {
                r = mid - 1
            }
        } else if n < target {
            // 在左边升序部分
            if n >= nums[0] {
                l = mid + 1
            } else { // n 在右边升序部分
                if target >= nums[0] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
    }
    return -1
}

let nums = [4, 5, 6, 7, 0, 1, 2]
let res = search(nums, 0)
print(res)
