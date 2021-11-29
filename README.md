Takeaway Challenge
-------
<br/>
The goal was to create a platform that would allow a user to place a takeway order. I decided to break down the project into four classes. The `Dish` and `Menu` classes were created to provide future expansion. I could have set a menu in the initialize method of the `Takeaway` class but I thought this would be cleaner and more future proof. 

The `Takeaway` class provides the functionality of the program:

- `list_dishes` to get a list of all available dishes
- `order` lets you add dishes to your order
- `check_order` shows a breakdown of the order with prices
- `complete_order` sends out a confirmation text with expected delivery time

This class is injected with `Menu.new` by default but could be provided with another menu class if this were required. It is also injected with `SMS.new`, which uses TWILIO API to send out a confirmation text for the order.

In order to protect senstitive information storing API authentication data and phone numbers, these were all placed as `ENV` variables inside a .env file which is not added to version control.

<br/>

Instructions
-------
```
irb -r ./lib/takeaway.rb
takeaway = Takeaway.new
```


