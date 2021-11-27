# Takeaway 
* A Takeaway program that allows you to look at a menu, add items to your order, and have a text sent to you on order completion.

Usage:

## Start
```
irb -r './lib/menu' -r './lib/order'
menu = Menu.new
order = Order.new
```
## Showing menu items and adding to order
```
menu.show
menu.add_to_order(order, item)
```
## Viewing order summary and completing an order
```
order.total
order.summary
order.complete
```

* Functionality implemented:
  * List of dishes with prices.
  * Add items to order.
  * Show order summary and total.
  * Sends a text using Twilio API that the order was placed successfully.
  * Uses mocks and stubs e.g. to ensure texts aren't sent during testing.
