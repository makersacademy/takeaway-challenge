# Takeaway Challenge

As a customer be able to order see a list of dishes and prices, select those dishes, check the total and on completion of the order receive a text message for conformation.

## Approach

I planned out using the user story the main objects and how they should interact with one another. Once I had an idea on how to approach the problem I started feature testing using IRB, moving on the writing the unit tests in rspec. Once the test was written I would move on to solving the failing test by writing the code to make it pass. I continued throughout the project this way using the TDD approach until some refactoring had to take place as I wanted to move some display methods into a new class.

## Reflection
The Order class contained in the order.rb file acts as a sort of hub that all customer interactions go through, I would like to send more time making sure the dependencies are used in an efficient way as currently the instance of the order class contains a lot of variables. I would also like to add to some of the tests as I found it difficult completely testing the Twilio messenger part of the messenger class, although I did manage to stub effectively so as to stop texts being sent out whenever the tests were run! Also I should change some of the tests to reflect the London Style.

## Examples in IRB

        2.5.0 :001 > require './lib/order'

        2.5.0 :002 > new_order = Order.new

        2.5.0 :003 > new_order.display_menu
        1: Chick'n Burger £7
        2: Chick'n Spicy Burger £7
        3: Hamburger Deluxe £6
        4: Hamburger Cheese £6
        5: Fries £2
        6: Mac 'n Cheese £5
        7: Coleslaw £3
        8: Gravy £1

        2.5.0 :004 > new_order.add_items(2 ,2)
        2.5.0 :005 > new_order.add_items(5 ,1)
        2.5.0 :006 > new_order.add_items(2 ,3)

        2.5.0 :007 > new_order.display_order
        1: Chick'n Spicy Burger x5 - £35
        2: Fries x1 - £2
        Total: £37

        2.5.0 :008 > new_order.complete_order

## Extras

- SMS sent contains both total amount owning and current time + 1 hour
- Menu is currently loaded from a CSV file, so new menus can be easily swapped in

## Methods within Order class

- new_order = Order.new (creates new order)
- new_order.display_menu (displays menu)
- new_order.display_order (displays current order, broken down by number and price totals)
- new_order.add_items(1, 2) (adds items from the menu into your order, first number represents the item number on the menu list and the second is the amount you want with a default of 1)
- new_order.reset_order (wipes order)
- new_order.complete_order (sends SMS containing the total amount owed and a delivery time 1 hour ahead of time order)
