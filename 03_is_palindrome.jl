#=
Problem 3: Palindrome number

Determine whether an integer is a palindrome.
An integer is a palindrome when it reads the same backward as forward.

Additional challenge: can you solve it without converting the integer to a string?

Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools

function ispalindrome(x::Int64)
"""
    ispalindrome(x::Int64) -> Bool

Returns true if input x is a palindrome number

Example:
ispalindrome(121)

Input: 121
Output: true


Example:
ispalindrome(-121)

Input: -121
Output: false
Explanation: -121 != 121-
"""

    # If negative, cannot be a palindrome
    if (x<0)
        return false
    else
        # Convert to string and then reverse
        x_str = string(x)
        x_rev = reverse(x_str)
        if x_str == x_rev # then it is a palindrome
            return true
        else # then it is not a palindrome
            return false
        end
    end
end

# Example parameter:
#a = ispalindrome(12121)
#println(a)

# To benchmark:
bm = @benchmark ispalindrome(x) setup=(x=12121)
display(bm)
