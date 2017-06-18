
## Takeaway Challenge ##

This script captures the main functionality of a simple takeaway app. You can do the following: view the menu, add items off the menu to a basket, view a summary of an order, and checkout.

## Run ##

Run the following commands:

```
$ git clone git@github.com:jkingharman/takeaway_challenge.git
$ cd takeaway_challenge
$ bundle
$ ruby ./lib/takeaway.rb
```
## Test ##

```
$ rspec
```

## IRB Example ##

```
2.4.0 :002 > take = Takeaway.new
 => #<Takeaway:0x007fa91c1d7938 @menu=#<Menu:0x007fa91c1d7910 @printer=#<Printer:0x007fa91c1d78e8>, @dishes={:Pizza=>10.0, :Pasta=>12.5, :Salad=>5.25, :Fries=>4.0}>, @order=#<Order:0x007fa91c1d7848 @basket={}, @total=0.0, @menu=#<Menu:0x007fa91c1d77a8 @printer=#<Printer:0x007fa91c1d7780>, @dishes={:Pizza=>10.0, :Pasta=>12.5, :Salad=>5.25, :Fries=>4.0}>, @printer=#<Printer:0x007fa91c1d7820>>, @messenger=#<Messenger:0x007fa91c1d76b8 @client=<Twilio::REST::Client @account_sid=>>>
2.4.0 :003 > takeaway.show_menu
NameError: undefined local variable or method `takeaway' for main:Object
	from (irb):3
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :004 > take.show_menu
1. Pizza -- £10.0
2. Pasta -- £12.5
3. Salad -- £5.25
4. Fries -- £4.0
 => {:Pizza=>10.0, :Pasta=>12.5, :Salad=>5.25, :Fries=>4.0}
2.4.0 :005 > take.add("Pasta")
 => 12.5
2.4.0 :006 > take.add("Pizza", 5)
 => 62.5
2.4.0 :007 > take.summary
Dish: Pasta X1.
Dish: Pizza X5.
Total cost: 62.5
 => nil
2.4.0 :008 > take.checkout(10)
RuntimeError: You're short. Please pay the correct sum man.
	from /Users/jkh/Desktop/Projects/takeaway-challenge/takeaway-challenge/lib/takeaway.rb:40:in `check_correct'
	from /Users/jkh/Desktop/Projects/takeaway-challenge/takeaway-challenge/lib/takeaway.rb:31:in `checkout'
	from (irb):8
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :009 > take.add("Pie")
RuntimeError: That's not on the menu!
	from /Users/jkh/Desktop/Projects/takeaway-challenge/takeaway-challenge/lib/takeaway.rb:44:in `check_right'
	from /Users/jkh/Desktop/Projects/takeaway-challenge/takeaway-challenge/lib/takeaway.rb:22:in `add'
	from (irb):9
	from /Users/jkh/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
```
