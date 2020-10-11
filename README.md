# Takeaway Challenge

This application lets a user to order takeaway and receive a text message confirmation.


### Setup
1. Clone this repo
2. Run `bundle install`
3. Run IRB with order.rb required: `irb -r ./lib/order.rb'`

_Note_: The app uses environment variables for twilio account SID, auth token, number and your personal number. Store them in a .env file in the root folder.

### How to Use

1. Create an order: `new_order = Order.new`
2. Have a look at the menu: `new_order.show_menu`
3. Add some items: `new_order.add_item("Blini")`
4. (_Optional_) Check your order and subtotal: `new_order.show_order`
5. Place the order: `new_order.place_order`
6. Check your phone, you should receive a text with your estimated deelivery time (1 hour)!

