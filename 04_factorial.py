# Problem 4:

# Description: Write a program which can compute the factorial of a given number.
# The results should be printed in a single line.
# Example:
#
# Suppose the following input is supplied to the program:
# 8
# then, the output should be:
# 40320
#

def factorial(n):
    
    if(n>1):
        return n*factorial(n-1)
    else:
        return n
    
if __name__ == "__main__":    
    print(factorial(8))
    
