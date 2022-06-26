/*
98. 验证二叉搜索树
给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

有效 二叉搜索树定义如下：

节点的左子树只包含 小于 当前节点的数。
节点的右子树只包含 大于 当前节点的数。
所有左子树和右子树自身必须也是二叉搜索树。
 

示例 1：


输入：root = [2,1,3]
输出：true
示例 2：


输入：root = [5,1,4,null,null,3,6]
输出：false
解释：根节点的值是 5 ，但是右子节点的值是 4 。
*/



func isValidBST(_ root: TreeNode?) -> Bool {
    if let _root = root {
        if let left = _root.left, let right = _root.right {
            if left.val < _root.val && right.val > _root.val {
                return isValidBST(left) && isValidBST(right)
            } else {
                return false
            }
        } else {
            return true
        }
    } else {
        return true
    }
    //return false
}