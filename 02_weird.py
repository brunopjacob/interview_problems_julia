#Problem 2

# Description: Given an integer, n, perform the following conditional actions:
#
#If  is odd, print "Weird"
#If  is even and in the inclusive range of 2 to 5, print "Not Weird"
#If  is even and in the inclusive range of 6 to 20, print "Weird"
#If  is even and greater than 20, print "Not Weird"
# Use a class (solve in a OOP fashion)

class MyNumber():
    def __init__(self,n):
        self.n = n
        if (n%2 != 0): # then n is odd
            print("Weird")
        elif (n <= 5 and n >= 2):
            print("Not Weird")
        elif (n >=6 and n <= 20):
            print("Weird")
        else:
            print("Not Weird")

if __name__ == "__main__":
    temp = MyNumber(3) # Should print "Weird"
    temp = MyNumber(4) # Should print "Not Weird"
    temp = MyNumber(8) # Should print "Weird"
    temp = MyNumber(30) # Should print "Not Weird"
     
