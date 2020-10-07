#=
Problem 2:

Given a 32-bit signed integer, reverse digits of an integer.

Note:
Assume we are dealing with an environment that could only store integers within
the 32-bit signed integer range: [−2^31,  2^31 − 1].

For the purpose of this problem, assume that your function returns 0 when the
reversed integer overflows.

Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools # To enable benchmarking of the code

# main function
function reverse_digits(x::Int64)
    """
        reverse_digits(x::Int64) -> Int64

    Returns the digits of input x in reverse order

    Example:
    reverse_digits(1234)

    Input: 1234
    Output: 4321
    """

    # Initial value of reversed number
    x_reversed::Int64 = 0

    while (x!=0)
        pop = x % 10 # Pop last number (since number is in base 10)
        x = floor(x/10) # Remove last number from x
        x_reversed = x_reversed*10 + pop # Add popped number to x_reversed
    end

    # Check if reversed number overflows
    if (x_reversed > 2^31-1 || x_reversed < -2^31)
    return 0
    else
        return x_reversed
    end

end

# Example parameters:
#a = reverse_digits(123456789)
#println(a)

# To benchmark:
bm = @benchmark reverse_digits(x) setup=(x=12346789)
display(bm)
