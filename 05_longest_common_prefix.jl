#=
Problem 5: Longest common prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.


Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools

function longest_common_prefix(x::Array{String,1})

"""
longest_common_prefix(x::Array{String,1}) -> String

Finds the longest common prefix string amongst an array of strings.
If no prefix is found, returns an empty string "".

Example:
longest_common_prefix(["flower","flow","flight"])

Input: ["flower","flow","flight"]
Output: "fl"
"""

    # Default empty string
    prefix = string()
    if (length(x) == 1)
        return x
    end

    # Sort string by length
    sort!(x, by=length)

    # Store first element of sorted list
    word = x[1]
    deleteat!(x,1)


    # Length of the shortest word
    len_word = length(word)


    # Loop over characters of the shortest word and assemble prefix string
    for i in 1:len_word
        c = word[i]

        # Checks if first entry is present in all words of x
        if all( [a[i] == c for a in x] )
            prefix *= c
        else
            break
        end
    end

    return prefix

end


# Example parameter:
#a = longest_common_prefix(["flower","flow","flight"])
#println(a)

# To benchmark:
bm = @benchmark longest_common_prefix(x) setup=(x=["flower","flow","flight"])
display(bm)
