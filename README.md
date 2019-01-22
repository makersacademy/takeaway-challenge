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

### My approach [![Build Status](https://travis-ci.org/Debora38/takeaway-challenge.svg?branch=master)](https://travis-ci.org/Debora38/takeaway-challenge)

| NOUN | VERB |
|-------|------|
| Takeaway | @sum_total, <br>show_menu(), place_order(), send_confirmation() |
| Menu | @menu = [],<br>add(), to_string()|
| Dish | @dish_name, @price |
<br>

As the weekly goal was getting familiar with dependency injection, I spend quite a long time implementing a `Dish class`, called from the `Menu class` via methods like `menu_add(dish, price)`, `show_menu`.<br>
The program was in working conditions until it got complicated retrieving the dish prices from the `Dish class`, via the `Menu class`, while placing orders in the `Takeaway class`.<br>
Therefore, after exercising on the `Dish class` to better understand the weekly goal on dependency injection, I applied the <b>YAGNI principle</b> to my program and got rid of the `Dish class` and all of the methods in the `Menu class`, hardcoding a menu in a Hash.<br>
<br>


| NOUN | VERB |
|-------|------|
| Takeaway | @sum_total,<br>show_menu(), place_order(), send_confirmation() |
| Menu | @menu = {} |
|Twilio| send_confirmation()|
<br>

<br>

`Place_order` method was implemented and <b>Twilio API</b> was my next challenge. After reading Twilio docs and creating a module in working order, I had to mock the `send_confirmation` method under `place_order`, not to send SMS when running RSpec.

### After Monday's review

| NOUN | VERB |
|-------|------|
| Takeaway | show_menu(), place_order(), checkout() |
| Display | to_string() |
| Menu | @menu,<br>add() |
| Dish | @dish_name, @price |
| Order | @total_cost, @new_order,<br> place_order(), update_total_cost(), find_price(),<br>complete_order(), delivery(), clear_order() |
| SMS | @client,<br>set_delivery_time(), send_confirmation() |

<br>

After peer and group review on Monday morning, I decided to retrieve my old code and debug it to make the actual `Menu` class dynamic. The `Menu` class now creates instances of `Dish` class via `add()` and stores the instances in an Array.
`Order` class has also been restored and all methods calculating and storing the actual order have been moved.<br>
<br>
`Takeaway` class still runs the program but stores only methods which call other classes actually running them.<br>
`show_menu` calls the `Display` class which calls `Menu`<i>(via `Order` - I'll come to this later on)</i>, which calls `Dish`.<br>
`place_order` and `checkout` call the `Order` class.<br>
<br>
`Takeaway` initializes `Order.new` and `Display.new`, however `Menu.new` has been initialized in the `Order` class as it came easier once calling `dish.price`. If `Menu.new` would be initialized via `Takeaway`, the `Order` class would need to either require `Takeaway` or `Menu` to get to `dish.price`, however this dependency injection would create a new instance and not calling the one used to `add()` dishes. I momentarily fixed this by initializing `Menu.new` in the `Order` class and calling it from `Takeaway` to then send it to `Display`. A better solution should come with more experience.<br>
<br>
The above paragraph was the actual challenge that made me to switch to hard-coded menu over the weekend, to get through the rest of the tasks. `find_price` in the `Order` class works now, however I am sure that there is a better code for this functionality.<br>
<br>
Twilio has been refactored into a class `SMS` and stubbed the same way as before in RSpec. Creating a `Fake_client` class to call in RSpec, will be a solution once I gain more experience.
