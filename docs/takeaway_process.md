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

REFACTOR - Passed print method result as a method rather than a string, refactored test

PASSED, 100% COVERAGE


RED - Made menu and menu_spec, described menu

(NameError:
  uninitialized constant Menu)

GREEN - Defined Menu class

PASSED, 100% COVERAGE

RED - Renamed methods to remove word 'print', expected menu.show to print a list

( NoMethodError:
       undefined method 'show')

RED - Defined show method to return @show_menu

( NameError:
       undefined local variable or method 'show_menu')

RED - Initialized Menu to have @show_menu variable with dishes and prices

( NameError:
       undefined local variable or method 'show_menu')

GREEN - Made @show_menu a visible attribute

REFACTOR - Made @show_menu a hash of dishes and prices, updated the test to expect a string

PASSED, 100% COVERAGE
