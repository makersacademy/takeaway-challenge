The user will make a menu.
Go through menu with see_menu.
When ready to order, create new order
  - accepts different menu to be passed.
  - accepts different message service to be passed.
Order.add(dish, quantity)
Order.check
Order.checkout (when ready to leave)

No Takeaway class.

hardcoded menu in Menu class.
- see dishes available in menu class.

Order class is the highest one.

injected dependency of Menu.new and SMS.new. Also holds basket.
- menu allows the user to see the menu (could have add in a different menu if there was one)
<!-- - sms allows access to SMS - messenger -->
- basket is held as an array which will hold hashes of items added.

Menu is a little redundant, only having one option.

- add_to_item takes dish and quantity. Fail if not on menu. Adds to basket quantity no. times. Gives confirmation message.

- basket_checkout simply sends message that it's being delivered.
    - add check order to this?

- check_order shows formatted basket and total
    - more room to make this prettier

- pretty basic private method is too long. splitting adds more repetition though, as need to iterate over again to get total.

SMS - account info and auth code are not held securely!
