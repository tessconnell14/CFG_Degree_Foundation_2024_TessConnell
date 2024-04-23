"""
HANDSHAKE CHALLENGE

You will need to:
- Write a function that takes an integer for the number of people and returns an integer with the number of handshakes
- There is a 6 mark penalty for not making it recursive.
   -> HINT: For those doing non-recursive, there is a formula online for this problem that generalises the equation
- Validate if a handshake can occur given X as an input
- Identify an error state and throw a custom exception
- Create a test file for the function and create a comprehensive test suite

"""

# Formula n × (n - 1) / 2

class InvalidInput(Exception):
    """"Exception for invalid input"""


def no_of_handshakes(no_people):

    if no_people < 2:
        raise Exception("Invalid input! Enter a number above 1")

    handshakes = no_people * (no_people - 1) / 2
    return handshakes

# Test cases
try:
    assert no_of_handshakes(1) == 0
    assert no_of_handshakes(2) == 1
    assert no_of_handshakes(3) == 3

    no_of_handshakes(X)
    no_of_handshakes("X")

except InvalidInput:
    print("Invalid input! Enter a number above 1")