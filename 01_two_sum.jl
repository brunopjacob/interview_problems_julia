#=
Problem 1:

Given an array of integers nums and an integer target,
return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one
solution, and you may not use the same element twice.

You can return the answer in any order.

Example:
Input: nums = [2,7,11,15], target = 9
Output: [1,2]
Output: Because nums[1] + nums[2] == 9, we return [1, 2].

Constraints:

2 <= nums.length <= 10^5
-10^9 <= nums[i] <= 10^9
-10^9 <= target <= 10^9
Only one valid answer exists.


Credits: LeetCode. All rights reserved.

Solution author: Bruno Jacob, UCSB
bruno@engineering.ucsb.edu
=#

# Import libraries
using BenchmarkTools # To enable benchmarking of the code

# Main function
function find_nums(nums,target)

    # Transform nums array into dictionary (keys = entries of nums, values = indices)
    nums_dict = Dict{Int64,Int64}() # initialize dictionary
    for i in 1:length(nums)
        nums_dict[nums[i]] = i
    end

    # Loop over list computing the number to be found (target - nums[i])
    for i in 1:length(nums)

        # Compute number to be found
        number = target-nums[i]

        # Search the dictionary to see if number exists
        if haskey(nums_dict,number) # if number is in the dictionary
            inum,jnum = i,nums_dict[number]
            return inum,jnum
        end

    end

end


# Example parameters:
nums = [2,7,11,15];
target = 9;

# To run:
#indices = find_nums(nums,target)
#println(indices)

# To benchmark:
bm = @benchmark find_nums(nums,target) setup=(nums=nums,target=target);
display(bm)
