/*
 114. 二叉树展开为链表
 给你二叉树的根结点 root ，请你将它展开为一个单链表：

 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
 展开后的单链表应该与二叉树 先序遍历 顺序相同。

 示例 1：

 输入：root = [1,2,5,3,4,null,6]
 输出：[1,null,2,null,3,null,4,null,5,null,6]
 示例 2：

 输入：root = []
 输出：[]
 示例 3：

 输入：root = [0]
 输出：[0]

 提示：

 树中结点数在范围 [0, 2000] 内
 -100 <= Node.val <= 100

 */

/*
 思路：
 	二叉树深度遍历
 	对每个节点进行改变，left换到right位置，right移动到left->right位置

 */

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func flatten(_ root: TreeNode?) {
    if root == nil { return }

    flatten(root?.left)
    flatten(root?.right)

    let left = root?.left
    let right = root?.right

    root?.left = nil
    root?.right = left

    var p = root
    while p?.right != nil {
        p = p?.right
    }
    p?.right = right
}
