""" Basic BST code for inserting (i.e. building) and printing a tree

    Your ***second standard viva task*** (of 5) will be to implement a find method into
    the class BinaryTree from pseudocode. See the lab task sheet for Week 5. 

    Your ***first advanced viva task*** (of 3) will be to implement a remove (delete) method
    into the class Binary Tree from partial pseudocode. See the lab task sheet for Week 5 (available in Week 5).

    There will be some ***introductory challenges*** in Week 4, with solutions released in Week 5.
    It is STRONGLY RECOMMENDED you attempt these!

    Since the given code is in python it is strongly suggested you stay with python; but
    if you want to reimplement as C++ this is also OK (see the Week 5 lab sheet guidance). 
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

def bfs(root, target):
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

# BFS function that returns the parent node
def BFS_Parent(root, target):
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


def removeLeafNode(root, target):
    node = bfs(root, target)
    if node != None:
        if node.left or node.right:                             # if the target has a child
            print('Target found. Cannot Delete as not leaf')    # print that cannot delete 
        else:
            parent = BFS_Parent(root, target)
            print(parent.data)

            if parent.left:
                if parent.left.data == target:                  # if the target root is the parent's left child
                    parent.left = None                          # delete the left child
                    print('Target found and deleted')           # inform
            if parent.right:                                  # if the target is the right child's data
                parent.right = None                             # delete the right child                       
                print('Target found and deleted')               # inform
    else:
        print('Target not found, nothing to delete')            # inform



#example calls, which construct and display the tree       
bst = BinaryTree()
bst.insert(4)
bst.insert(2)
bst.insert(6)
bst.insert(1)
bst.insert(3)
bst.insert(5)
bst.insert(7)
#bst.insert(8)
#bst.insert(9)
#bst.insert(10)
#bst.insert(11)
##bst.insert(12)
##bst.insert(13)
##bst.insert(14)
##bst.insert(15)
##bst.insert(100)
##bst.insert(200)

print("Current tree \n")
bst.display(bst.root)
print("Deleting leaf node 3 \n")
removeLeafNode(bst.root, 3)
bst.display(bst.root)





