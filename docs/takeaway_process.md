# Takeaway

# Plan

Classes: takeaway, menu

# Log

Created Takeaway class and described it.

RED - Expected takeaway.menu to show a meal and a price

(expected: "Vindaloo: £6"
            got: nil)

RED - Passed menu to test initialize of takeaway class and made it a readable attribute

(NameError:
       undefined local variable or method 'menu')

RED - Doubled menu class for takeaway test

(expected: "Vindaloo: £6"
            got: nil)

RED - made read_menu method print menu object

(#<Double :menu> received unexpected message :print with (no args))

GREEN - Passed print method to the menu double with result

PASSED, 100% COVERAGE

REFACTOR - Passed print method result as a method rather than a string, refactored test

PASSED, 100% COVERAGE
