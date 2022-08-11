"""
    

    Here are solutions to 2 ***introductory challenges*** set in Week 4 (these solutions released in Week 5).

    CHALLENGE 1: Use Breadth First Search to find a target. Inform if found or not

    CHALLENGE 2: Find a target and delete it ONLY if it is a leaf. If is found but not a leaf, inform if has been found but cannot be deleted.
    If not found inform, i.e. target is not found.

    NOTES: BFS is tricky because it requires us to hop between levels as we do our traversal. A straightforward way of doing the
    traversal is to use a queue and enqueue and dequeue nodes as shown. Whenever a node is dequeued, this is the next value in our breadth
    first traversal. When / if the target is found, we finish - and whatever is in the queue is not considered further.

    The delete solution uses the BFS to find the target and if it is a leaf, we need to find the parent as we can only delete a child of
    a parent from a BST, never the node directly - EXCEPT the root, which can have no parent.

    These were both **challenging** tasks to get you into thinking about traversal and deletion of nodes in a BST. 

    


"""

import math

""" Node class
"""

class Node:
    def __init__(self, data = None):
        self.data = data
        self.left = None
        self.right = None

""" BST class with insert and display methods. display pretty prints the tree
"""

class BinaryTree:
    def __init__(self):
        self.root = None

    def insert(self, data):
        if self.root is None:
            self.root = Node(data)
        else:
            self._insert(data, self.root)

    def _insert(self, data, cur_node):
        if data < cur_node.data:
            if cur_node.left is None:
                cur_node.left = Node(data)
            else:
                self._insert(data, cur_node.left)
        elif data > cur_node.data:
            if cur_node.right is None:
                cur_node.right = Node(data)
            else:
                self._insert(data, cur_node.right)
        else:
            print("Value already present in tree")

    def display(self, cur_node):
        if cur_node == None:
            print('no tree to print')
            return
        lines, _, _, _ = self._display(cur_node)
        for line in lines:
            print(line)


    def _display(self, cur_node):
        
        if cur_node.right is None and cur_node.left is None:
            line = '%s' % cur_node.data
            width = len(line)
            height = 1
            middle = width // 2
            return [line], width, height, middle

        if cur_node.right is None:
            lines, n, p, x = self._display(cur_node.left)
            s = '%s' % cur_node.data
            u = len(s)
            first_line = (x + 1) * ' ' + (n - x - 1) * '_' + s
            second_line = x * ' ' + '/' + (n - x - 1 + u) * ' '
            shifted_lines = [line + u * ' ' for line in lines]
            return [first_line, second_line] + shifted_lines, n + u, p + 2, n + u // 2
        
        if cur_node.left is None:
            lines, n, p, x = self._display(cur_node.right)
            s = '%s' % cur_node.data
            u = len(s)
            first_line = s + x * '_' + (n - x) * ' '
            second_line = (u + x) * ' ' + '\\' + (n - x - 1) * ' '
            shifted_lines = [u * ' ' + line for line in lines]
            return [first_line, second_line] + shifted_lines, n + u, p + 2, u // 2

        left, n, p, x = self._display(cur_node.left)
        right, m, q, y = self._display(cur_node.right)
        s = '%s' % cur_node.data
        u = len(s)
        first_line = (x + 1) * ' ' + (n - x - 1) * '_' + s + y * '_' + (m - y) * ' '
        second_line = x * ' ' + '/' + (n - x - 1 + u + y) * ' ' + '\\' + (m - y - 1) * ' '
        if p < q:
            left += [n * ' '] * (q - p)
        elif q < p:
            right += [m * ' '] * (p - q)
        zipped_lines = zip(left, right)
        lines = [first_line, second_line] + [a + u * ' ' + b for a, b in zipped_lines]
        return lines, n + m + u, max(p, q) + 2, n + u // 2

""" Function to print the queue and tell us what length it is. Useful for tracing and debugging BFS
"""

def printQueue(queue):
    print('queue is',len(queue),'long:', end=" ")       # tells us length of the queue + no line return
    for i in range (len(queue)):                        
        print(queue[i].data, end=" ")                   # prints the contents of the queue without line returns
    print()
    

""" Function for level order traversal which terminates when the target is found or when we reach the end of the tree
"""

def Breadth_First_Search(root, target):
    if root is None:                                    # if there is no tree, we are done
        return
    
    queue = []                                          # create an empty queue for level order traversal 
 
    
    queue.append(root)                                  # enqueue root
    # printQueue(queue)                                 # whenever a node is added to the queue, print it (trace)
 
    while(len(queue) > 0):

        if (queue[0].data == target):                   # if the head of the queue is the target, notify, return and terminate
            print("FOUND", target)
            return queue[0]                             
                                                        
        print (queue[0].data, end=" ")                  # print head of queue with no linebreak; this is our level order traversal       
        node = queue.pop(0)                             # remove head from queue, which will be current node to consider
 
        if node.left is not None:                       # if current node has left child, enqueue it (add it to tail of queue)
            queue.append(node.left)
            # printQueue(queue)
 
        if node.right is not None:                      # if current node has right child, enqueue it (add it to tail of queue)
            queue.append(node.right)
            # printQueue(queue)

    print('TARGET NOT FOUND')                           # if while loop completes target is not found
    return None


""" Function to delete a leaf (but no other node)
"""
         
def Delete_Leaf(root, target):
    node = Breadth_First_Search(root, target)                   # search for target
    if node != None:                                            # if the target has been found
        if node.left or node.right:                             # if the target has any child
            print('Target found. Cannot Delete as not leaf')    # notify cannot delete  
        else:
            parent = BFS_for_parent(root, target)               # if the target has no child, get its parent
            if parent.left:
                if parent.left.data == target:                  # if the target is the left child's data
                    parent.left = None                          # delete the left child
                    print('Target found and deleted')           # inform
            elif parent.right:                                  # if the target is the right child's data
                parent.right = None                             # delete the right child                       
                print('Target found and deleted')               # inform
    else:
        print('Target not found, nothing to delete')            # inform



""" Code is indentical to Breadth_First_Search except that instead of returning the target,
    it returns the parent of the target.
    This is because if a node is anything other than the root, we cannot delete it directly,
    but only by reference to its parent: we delete the child of a parent. 
"""

def BFS_for_parent(root, target):
    if root is None:
        return

    queue = []
 
    queue.append(root)

    while(len(queue) > 0):

        if queue[0].left:
            if (queue[0].left.data == target):
                return queue[0]

        if queue[0].right:
            if (queue[0].right.data == target):
                return queue[0]
                                                                # if the node is the parent of the target, return it
        node = queue.pop(0)
 
        if node.left is not None:
            queue.append(node.left)
 
        if node.right is not None:
            queue.append(node.right)

    return None
    

#example calls, which construct and display the tree       
bst = BinaryTree()
bst.insert(4)
bst.insert(2)
bst.insert(6)
bst.insert(1)
bst.insert(3)
bst.insert(5)
bst.insert(7)
bst.insert(8)
bst.insert(9)
##bst.insert(10)
##bst.insert(11)
##bst.insert(12)
##bst.insert(13)
##bst.insert(14)
##bst.insert(15)
##bst.insert(100)
##bst.insert(200)

bst.display(bst.root)
# Breadth_First_Search(bst.root, 1)
Delete_Leaf(bst.root, 9)
# bst.display(bst.root)
# bst.root = None
bst.display(bst.root)





