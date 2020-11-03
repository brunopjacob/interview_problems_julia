#=
Problem 7: Merge two sorted lists

Merge two sorted linked lists and return it as a new sorted list.
The new list should be made by splicing together the nodes of the first two lists.

Example 1:

Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 2:

Input: l1 = [], l2 = []
Output: []

Example 3:

Input: l1 = [], l2 = [0]
Output: [0]

Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools

# Structure to create Node
mutable struct Node
    data::Any
    next::Any
    # Node constructor
    function Node(data=nothing,next=nothing)
        return new(data,next)
    end
end

# Structure to create LinkedList
mutable struct LinkedList
    head::Any
    # LinkedList constructor
    function LinkedList(head=nothing)
        return new(head)
    end
end

# This method works for all x (multiple dispatch)
function copyNode(x)
    cp = Node()
    cp.data = copy(x.data)
    cp.next = copyNode(x.next)
    return cp
end

# This method works for the end of the list
function copyNode(x::Nothing)
    cp = nothing
    return cp
end

# This method copies the head of the list and its nodes
function copyList(x::LinkedList)
    cp = LinkedList()
    cp.head = copyNode(x.head)
    return cp
end

# This method prints the elements of the list
function printList(x::LinkedList)
    cur_node = x.head
    while cur_node != nothing
        println(cur_node.data)
        cur_node = cur_node.next
    end
end

# This method appends new data to the list
function appendList(x::LinkedList,data)
    #new_node::Node = Node(data)
    new_node = Node(data)

    if (x.head == nothing)
        x.head = new_node
        return x.head
    end

    last_node = x.head
    while last_node.next != nothing
        last_node = last_node.next
    end
    last_node.next = new_node

end


# This method merges two sorted lists, x1 and x2, into one single sorted linked
# list
function mergeTwoLists(x1,x2)

    # If x1 or x2 is empty, return nothing
    if typeof(x1) == Nothing
        return x2
    end
    if typeof(x2) == Nothing
        return x1
    end

    # Get heads of lists
    p = x1.head
    q = x2.head

    # If p is empty
    if p == nothing
        return l2

     # If q is empty
     elseif q == nothing
         return l1

     # If none of the lists are empty
     else

         if p.data <= q.data
             s = p
             p = s.next
         else
            s = q
            q = s.next
         end

        # Assign new head
        new_head = s

        #Check other nodes
        while p != nothing && q != nothing
            if p.data <= q.data
                s.next = p
                s = p
                p = s.next
            else
                s.next = q
                s = q
                q = s.next
            end
        end

        # At this point, either p or q is nothing
        if p == nothing
            s.next = q
        else
            s.next = p
        end
    end
    return new_head
end


# Create two linked lists by appending elements
elements_l1 = [1,2,4]
elements_l2 = [1,3,4]

l1 = LinkedList()
for i in elements_l1
    appendList(l1,i)
end

l2 = LinkedList()
for i in elements_l2
    appendList(l2,i)
end

# Put lists in a tuple and create a function to copy lists before passing
# to avoid erasing the original list (by default, args will be modified as
# Julia passes it by reference)
lists = l1,l2
function testing(lists)
    l1,l2 = lists
    ll1 = copyList(l1)
    ll2 = copyList(l2)
    a = mergeTwoLists(ll1,ll2)
end

# Example run (uncomment to run once):
#ll1 = copyList(l1)
#ll2 = copyList(l2)
#a = mergeTwoLists(ll1,ll2)
#println(a)

# To benchmark (uncomment to run benchmark)
bm = @benchmark testing(s) setup=(s=lists)
display(bm)
