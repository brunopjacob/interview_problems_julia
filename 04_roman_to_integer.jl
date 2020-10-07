#=
Problem 4: Roman to integer

Given a roman numeral, convert it to an integer.

Map of characters -> integers
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

Special cases (where characters indicate subtraction instead of sum):
I can be placed before V and X to make 4 and 9, respectively.
X can be placed before L and C to make 40 and 90, respectively.
C can be placed before D and M to make 400 and 900, respectively.


Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

using BenchmarkTools

function roman_to_int(x::String)

"""
roman_to_int(x::String) -> Int64

Given a string (roman number), returns the converted integer

Example:
roman_to_int("LVIII")

Input: "LVIII"
Output: 58
"""

    # Create dicts with special and general characters:
    special_dict = Dict{String,Int64}("IV"=>4, "IX"=>9, "XL"=>40, "XC"=>90, "CD"=> 400, "CM"=>900)
    general_dict = Dict{String,Int64}("I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000)

    # Initialize sum accumulator
    total = 0

    # First loop over string x to find the special characters
    for i in keys(special_dict)
        if occursin(i,x) # check if i-th key of special_dict occurs in string x
            total += special_dict[i] # count number
            x = replace(x,i=>"") # replace occurence i in x with nothing ("")
        end
    end

    # After accounting for the special cases, all the reminaing cases are general
    for i in x # loop over what's left of string
        # (note, must convert i to string, as it is a char in the iterator)
        total += general_dict[string(i)] # count number
    end

    return total
end


# Example parameter:
#a = roman_to_int("XLIV")
#println(a)

# To benchmark:
bm = @benchmark roman_to_int(x) setup=(x="XLIV")
display(bm)
