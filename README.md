# Takeaway challenge #
This is as simple app allowing customer to order food, get the bill right and get the confirmation via text message.

## How it works ##

### Checking what is on the menu ###
Obviously before We order our favourite dish We want to check is it available. How to do so? Just call todays_menu on the chosen restaurant like one example below.
```
2.5.0 :004 > takeaway.todays_menu
curry
1.0
pasta
3.0
basta
2.5
 => "So... What would you like? It is all fairly fresh"
 ```

### Altering the menu ###
Someone may ask why todays_menu not just menu. It is simply because restaurants may have a different offers for different days and according to the "fairly fresh" declaration some of the dishes might be seasonal. Restaurant owner can change the menu with two simple commands add(dish, price) or delete(dish).
```
2.5.0 :005 > takeaway.menu.delete('curry')
 => {"pasta"=>3.0, "basta"=>2.5}
2.5.0 :006 > takeaway.menu.add('lasagne', 4)
 => {"pasta"=>3.0, "basta"=>2.5, "lasagne"=>4}
 ```

### Ordering ###
Right so we know whats on, time to pick. Just name the restaurant and use order(name, quantity). If you do not specify the quantity, just one end up in your basket. If there is no such a dish on the menu You will get an error.
```
2.5.0 :004 > takeaway.order('banana')
Traceback (most recent call last):
        3: from /Users/patryk/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):4
        1: from /Users/patryk/Projects/takeaway-challenge/lib/restaurant.rb:14:in `order'
RuntimeError (Not on the menu!)
2.5.0 :005 > takeaway.order('pasta')
 => "1x pasta added to the basket, total: £3.0"
2.5.0 :006 > takeaway.order('curry', 2)
 => "2x curry added to the basket, total: £5.0"
```

### Basket ###
As you can see It all goes to the basket, and the app tells how much you have spent in total so far. If you get lost with your order You can always call a basket_summary to see what is there
```
2.5.0 :007 > takeaway.basket_summary
pasta
3.0
curry
1.0
curry
1.0
"Total: 5.0"
 => "Total: 5.0"
 ```

### Checkout ###
The final call is the checkout. Once you have all of your favourite dishes in the basket You can complete the order by calling checkout(total_amount). We want you to confirm the total_amount just to make sure that We are all on the same page. If there is any difference again You will get an error. If It is all fine You will get text message with confirmation and the time of delivery.
```
2.5.0 :015 > takeaway.checkout(4)
Traceback (most recent call last):
        3: from /Users/patryk/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):15
        1: from /Users/patryk/Projects/takeaway-challenge/lib/restaurant.rb:38:in `checkout'
RuntimeError (Hey it is 5.0 not 4)
2.5.0 :016 > takeaway.checkout(5)
 => "Enjoy your meal!"
 ```
 
