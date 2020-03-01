# Takeaway Challenge
Makers weekend challenge (week 2)

**Tech used**:
Ruby,
Rspec,
Rubocop,
Twilio

## Project aim
To write software that allows a user to order food

### Primary aims
* List of dishes with prices
* Ability to select a number of different available dishes
* Check the order and total are correct
* Receive a text confirming order and setting a time for delivery

**User Stories**
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## Installation instructions
1. Requires Ruby. Instructions to install are [here](https://www.ruby-lang.org/en/documentation/installation/).
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle`
4. When the installation completes, run `bundle` 
5. This software runs in irb

### Example run-through
```
>> irb
2.6.5 :001 > require './menu.rb'
 => true 
2.6.5 :002 > require './order.rb'
 => true 
2.6.5 :003 > 
2.6.5 :004 > menu = Menu.new
 => #<Menu:0x00007f8ed392f540 @items={}> 
2.6.5 :005 > menu.add_dish("chicken", 5)
 => 5 
2.6.5 :006 > menu.add_dish("fish", 3)
 => 3 
2.6.5 :007 > menu.add_dish("cabbage", 5)
 => 5 
2.6.5 :008 > takeaway = Takeaway.new(menu)
 => #<Takeaway:0x00007f8ed395dc60 @menu=#<Menu:0x00007f8ed392f540 @items={"chicken"=>5, "fish"=>3, "cabbage"=>5}>, @order=#<Order:0x00007f8ed395dc38 @menu=#<Menu:0x00007f8ed392f540 @items={"chicken"=>5, "fish"=>3, "cabbage"=>5}>, @order={}>> 
2.6.5 :009 > takeaway.print_menu
Takeaway Menu
-------------
1. Chicken: £5
2. Fish: £3
3. Cabbage: £5
 => [nil, nil, nil] 
2.6.5 :010 > takeaway.place_order("chicken", 1)
Order
----
chicken: 1
Total: £5
 => nil 
2.6.5 :011 > takeaway.place_order("cabbage", 1)
Order
----
chicken: 1
cabbage: 1
Total: £10
 => nil 
2.6.5 :012 > takeaway.complete_order(10)
 => "The order is correct" 
 ```

### Additional functionality
* My menu class allows for population of the menu (which will need to be done before you start ordering). This was functionality I thought the takeaway could use to update their menu as and when needed. I need to set it as a private method.

### Problems faced
* Issues with using doubles and mocks in testing the takeaway file. Something I need to do more practice on. Currently foregoing the text functionality in order to write more tests for the takeaway.rb file. It was easier writing the code than the tests first.
* Seemingly calling the menu twice when initializing `takeaway = Takeaway.new(menu)` - is not too much of a problem but isn't very neat
* When printing the order I have to call order twice in order for it to work:
```
def print_order
    puts "Order\n----" 
    @order.order.each do |dish, quantity|
      puts "#{dish}: #{quantity}"
    end
    puts "Total: £#{@order.total}"
  end
```
* Have not managed to get through the last user story and get a text sent out. The twilio gem is loaded and I have a number however getting the environmental variables to work properly hasn't worked. They are currently sitting in my .bashrc profile and in the .env file but the terminal doesn't seem to recognize when I try to call them using `ENV['XXX']`. Unsure how to proceed for security reasons. 
