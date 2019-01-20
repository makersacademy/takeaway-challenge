## TakeAway Challenge (week 2) - Debora Piu

This weekend challenge's instructions are summarised below:
<li> create a TakeAway with a menu
<li> show the menu
<li> implement placing orders
<li> check total cost
<li> send SMS confirmation with delivery time
<br>
<br>

#### New functionality to implement:

If the cost is correct the customer is sent a text saying that the order was placed successfully and that it will be delivered in 1 hour.
The text sending functionality should be implemented using <b>Twilio API</b>.
Use mocks and/or stubs, as necessary to not to send texts when your tests are run.

### My approach

| NOUN | VERB |
|-------|------|
| Takeaway | show_menu(), place_order(), @sum_total, send_confirmation() |
| Menu | add(), to_string(), menu = [] |
| Dish | @dish_name, @price |
<br>

As the weekly goal was getting familiar with dependency injection, I spend quite a long time implementing a `Dish class`, called from the `Menu class` via methods like `menu_add(dish, price)`, `show_menu`.<br>
The program was in working conditions until it got complicated retrieving the dish prices from the `Dish class`, via the `Menu class`, while placing orders in the `Takeaway class`.<br>
Therefore, after exercising on the `Dish class` to better understand the weekly goal on dependency injection, I applied the <b>YAGNI principle</b> to my program and got rid of the `Dish class` and all of the methods in the `Menu class`, hardcoding a menu in a Hash.<br>
<br>


| NOUN | VERB |
|-------|------|
| Takeaway | show_menu(), place_order(), @sum_total, send_confirmation() |
| Menu | menu = {} |
<br>

<br>

`Place_order` method was implemented and <b>Twilio API</b> was my next challenge. After reading Twilio docs and creating a module in working order, I had to mock the `send_confirmation` method under `place_order`, not to send SMS when running RSpec.
