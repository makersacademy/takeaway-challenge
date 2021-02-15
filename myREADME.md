# Takeaway App
---
### What is this app in one line?
This app is a simple model of your average takeaway delivery app.</br>

### What can you do with it?
Well you can do the following:
* View available dishes
* Put them in a shopping cart
* View the total cost
* Order them to your house! (not really)
* WIP: Get a confirmation text when the food is ordered!

## So how do I use this?
<p> Let me explain! You'll want to load the master file in and run it all from there:</p><br>

### 1. First open up 'irb' in your terminal
```
irb -r './lib/takeaway_app'
```
<p> Make sure you're in the takeaway-challenge directory and 
can see the "lib" folder from where you are.</p>

### 2. Make some dishes!
```
[dish_variable] = Dish.new('[dish_name], [dish_price_in_pounds]
pizza = Dish.new('Pizza', 12) # => makes a menu item 'Pizza, £12'
```
<p> Make as many dishes as you want! <br>
But remember to pass the name of the dish as a String argument.<br>
And remember to pass in a price in pounds as an Integer argument</p>

### 3. "Log into" your takeaway app!
```
[takeaway_variable] = TakeawayApp.new
just_eat = TakeawayApp.new
```
<p> Ok so this is a bit DIY, but you'll have to make your own takeaway app. <br>
In this example, we're "logging in" to Just Eat (if you will).</p>

### 4. Add all your dishes to the menu

```
just_eat.add_dish(pizza) # => adds the Pizza item to the menu
```

<p>Ok so this might be quite a tedious step! Please bear with!<br>
You'll need to add each dish to the menu.

### 5. Check the Menu!

```
just_eat.check # => "Pizza, £12"
```
<p> If you've added a few dishes to the menu, you'll see a big list of your dishes!<br>
At this point you should be getting hungry...</p>

### 6. Select a dish!

```
just_eat.select(pizza)
```
<p> Yes it's another tedious step, but this is important!<br>
In this section, you'll be adding each menu item to your shopping cart.<br>
If you want to order it, select it from the menu.</p>

### 7. View your order

```
just_eat.order.view_order # => "Pizza, £12"
```

<p> This method allows you to view your order before you confirm it! </b>

### 8. Order your food!

```
just_eat.order.confirm_order 
# => puts "Thank you! Your order was placed and will be delivered before 14:45"
# The time will always be an hour ahead of the local time on your device.
```
<p> Your confirmation message should appear in the terminal.<br>
I'm currently trying to figure out how to use Twilio to send the user<br>
a text with the confirmation message. Not quite there yet though!.

---

# Thanks for checking out my Takeaway App<br>
It's still a work in progress...




