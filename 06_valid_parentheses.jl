#=
Problem 6: Valid parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']',
determine if the input string is valid.

An input string is valid if:

1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.

Example 1:

Input: s = "()"
Output: true

Example 2:

Input: s = "()[]{}"
Output: true

Example 3:

Input: s = "(]"
Output: false

Example 4:

Input: s = "([)]"
Output: false


Example 5:

Input: s = "{[]}"
Output: true

Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools

function valid_parentheses(s::String)::Bool

    """
    valid_parentheses(x::String) -> Bool

    Given a string s containing just the following characters:
    '(', ')', '{', '}', '[' and ']',
    determines if the input string is valid.

    Example:
    valid_parentheses("()[]{}")

    Input: "()[]{}"
    Output: True
    """

    # Creates Dict bracket map:
    # Purpose: maps each bracket type with its closing counterpart
    # IMPORTANT: be careful, in Julia, '' are chars, "" are strings
    bracket_map = Dict('('=>')', '['=>']', '{'=>'}')

    # Creates list of open brackets
    open_list = ['(', '[', '{']

    # Create an empty stack list
    stack = []

    # Loop over chars in s:
    for i in s # Be careful, char will be of class char, not strings!

        # If i is an open bracket, append the char to the stack list
        if i in open_list
            append!(stack,i)

        # Else, check the last element in the stack list to see if its counterpart exists
        # (and make sure stack is not empty)
        elseif (length(stack)>0)
            if i == bracket_map[stack[end]]
                # Then pop element out of the stack
                pop!(stack)
            else
                return false
            end

        # In case char is different than the valid ones, returns false
        else
            return false
        end

    end
    # If stack is empty, return true; else, false
    return isempty(stack)
end

# Example parameter:
#a = valid_parentheses("[[{()[]{}}]]")
#println(a)

# To benchmark:
bm = @benchmark valid_parentheses(s) setup=(s="[[{()[]{}}]]")
display(bm)
