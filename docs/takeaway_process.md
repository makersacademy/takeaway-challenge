# Takeaway

# Plan

Classes: takeaway, menu

# Log

Created Takeaway class and described it.

RED - Expected takeaway.menu to show a meal and a price

(expected: {"Vindaloo" => 6, "Chips" => 3}
            got: nil)

RED - Passed menu to test initialize of takeaway class and made it a readable attribute

(NameError:
       undefined local variable or method 'menu')

RED - Doubled menu class for takeaway test

(expected: {"Vindaloo" => 6, "Chips" => 3}
            got: nil)

GREEN - made read_menu method print @menu

PASSED, 100% COVERAGE


RED - Made order class and spec, described and defined class

PASSED, 100% COVERAGE

RED - Expected order.show_menu to return full_menu

( NoMethodError:
       undefined method 'menu')

GREEN - Initialized order with menu instance

PASSED, 100% COVERAGE
USER CAN NOW SEE LIST OF MEALS AND PRICES, USER STORY 1

RED - Expected order.add to return the total of the meals

(NoMethodError:
       undefined method 'add')

RED - Defined add

(NoMethodError:
       undefined method '+' for nil:NilClass)

GREEN - Added total variable to Order

PASSED, 100% COVERAGE

REFACTOR - Changed test to expect a string stating total cost, and code to matches

PASSED, 100% COVERAGE
USER CAN NOW SELECT MEALS AND SEE TOTAL PRICE, PART USER STORY 2/3

RED - Expected order.add to run basket_add, adding a number of a dish to the basket

(expected: "2 portions of Vindaloo"
            got: nil)

GREEN - Changed test to read return of basket_add instead of @basket

PASSED, 100% COVERAGE
USER CAN NOW SELECT MEALS AND ADD THEM TO BASKET, USER STORY 2

RED - Expected verify_price to compare the final cost with the cost of the basket

(NoMethodError:
       undefined method 'verify_price')

RED - Defined verify_price

(expected: "Your total is £12 - Vindaloo (£6) x2 = £12"
            got: nil)

GREEN - Wrote the verify_price method

PASSED, 100% COVERAGE

REFACTOR - Rewrote basket_add to increment meal variables instead of pushing hashes, removed @basket

PASSED, 100% COVERAGE
