# Takeaway challenge

This app allows you to view menu, select dishes, view basket, calc total and place order. When you place an order, you must include your calculation of total. If it matches, the order will be placed and you receive a text message with estimated delivery time.

## Suggested usage in irb:
- `require "./lib/menu.rb"`
- `require "./lib/order.rb"`
- `require "./lib/total_checker.rb"`
- `require "./lib/text.rb"`
- `require "./lib/send-sms.rb"`
- `o = Order.new`
- `o.view_menu`
- `o.select_dish("chips", 2)`
- `o.select_dish("chicken chow mein")`
- `o.select_dish("doner kebab", 4)`
- `o.view_basket`
- `o.total`
- `o.place_order(17.60)` Your order will be placed and you will receive a text
- If you plae an order with the wrong total e.g. `o.place_order(5)`, you will receive an error saying you have miscalculated the total.

### Outstanding issues:

- I still don't seem to always be able to use doubles properly. Every time you place an order, a message is sent regardless of whether totals match, and this even happens when running rspec tests.
- I haven't made my phone number private on Github.
- I didn't finish the 'stretch' user story to allow orders to be placed via text message. I gave up at the "ngrok http 4567" stage. I was getting the following error: "bash: ngrok: command not found".

### Diagram of model
I used this diagram to help me plan my modelling.
![](https://github.com/clarepins/takeaway-challenge/blob/master/takeaway_diagram.JPG)
