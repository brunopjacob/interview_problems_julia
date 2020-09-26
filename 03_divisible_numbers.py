# Problem 3

# Write a program which will find all numbers which are divisible 
# by 7 but are not a multiple of 5, between 2000 and 3200 
# (both included). The numbers obtained should be printed in a 
# comma-separated sequence on a single line.

def find_numbers():
    # Creates empty list
    l = [] 
    
    # Search for the numbers and store them as strings (for posterior formatting)
    for i in range(2000,3200):
        if (i%7==0 and i%5!=0): # if divisible by 7 and not a multiple of 5
            l.append(str(i))
    
    # Print the list as requested
    print(','.join(l))
    
            
if __name__ == "__main__":
    
    # Call the function
    find_numbers()
