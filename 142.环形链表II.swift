/*

 142. 环形链表 II
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。

 说明：不允许修改给定的链表。

 进阶：

 你是否可以使用 O(1) 空间解决此题？

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：返回索引为 1 的链表节点
 解释：链表中有一个环，其尾部连接到第二个节点。
 示例 2：

 输入：head = [1,2], pos = 0
 输出：返回索引为 0 的链表节点
 解释：链表中有一个环，其尾部连接到第一个节点。
 示例 3：

 输入：head = [1], pos = -1
 输出：返回 null
 解释：链表中没有环。

 思路:
 		---------------------
 				  |   	    |
 |_________|

 Sf = 2Sl
 Sl = l1 + l2
 Sf = l1 + l2 + l3 + l2 = 2(l1 + l2)
 l3 = l1
 */

public class ListNode: Equatable {
    var val: Int
    var next: ListNode?

    public static func == (_ lfs: ListNode, _ rfs: ListNode) -> Bool {
        return lfs.val == rfs.val
    }

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    var fast = head, slow = head
    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next

        if fast === slow {
            var ptr = head
            while ptr != = slow {
                ptr = ptr?.next
                slow = slow?.next
            }
            return ptr
        }
    }

    return nil
}

let node1 = ListNode(-4, nil)
let node2 = ListNode(0, node1)
let node3 = ListNode(2, node2)
let node4 = ListNode(3, node3)
node1.next = node3

let node = detectCycle(node4)
print(node!.val)
