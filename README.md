Takeaway Challenge

---------------------------

order = order.new

List of dishes with prices: order.menu.list

Adding a dish to the basket. order.add("pizza", 3)
If the dish is not in the menu it will show a message.
If you add two times the the same dish, it will only add to the basket the quantity you specified the second time.

Check your basket: order.basket

Checking the total amount of your basket: order.total

Checkout: order.checkout(amount)
If the total amount is different from the amount given on checkout, it will show an error message.

I didn't have time to implement the text sending functionality with twilio.
