# Takeaway Challenge

## Context

Friday challenge for week four of the Makers bootcamp; this weeks objectives were based around object-oriented programming. For the challange we were given the below user stories, included here for reference. Further below is an explanation of my approach and some examples of my code being used.

## Task

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

## Approach

I read through the user stories and drew up a basic diagram of how I imagined the Classes working and talking to each other:

![Diagram 2](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/diagram2.png?raw=true)

I started testing and coding the List class first, so I could complete the first user story. I used doubles as fake "Dish" objects as I hadn't yet tested-driven a Dish class. 

Although it was not included in the user stories, I had to assume at some point a takeaway worker would create new dishes and add them to the list for a customer to browse. So from here I created the Dish class.

After that I went on to create the Order class which can select different dishes as a meal and then give a total amount for the order.

The fourth user story was the most complex for me as it involved testing that the message replied with the correct/expected time of the order delivery. It also involved the use of the Twilio app. I was able to use a stub to avoid calling the Twilio app during the rspec tests, but the code still works when correctly used in irb:

![Testing SMS on IRB](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/testing_sms_irb.png?raw=true)

![SMS received](https://github.com/alicegray33/takeaway-challenge/blob/main/docs/sms_received.jpg?raw=true)

The rspec tests all pass with 100% coverage and rubocop is happy.

## Example In Use

Below is an explanation of how this project can be used in irb.

First, create some dishes using the Dish class:
```
3.0.2 :006 > burger = Dish.new("Burger",3)
 => #<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3> 
3.0.2 :008 > pizza = Dish.new("Pizza",5)
 => #<Dish:0x00007fb7a293a4c0 @name="Pizza", @price=5> 
3.0.2 :009 > salad = Dish.new("Salad",2)
 => #<Dish:0x00007fb7a134d1a8 @name="Salad", @price=2> 
3.0.2 :010 > dip = Dish.new("Dip",1)
 => #<Dish:0x00007fb7a204eca8 @name="Dip", @price=1> 
```

Then we can create a list object and load those dishes into it:
```
3.0.2 :011 > list = List.new
 => #<List:0x00007fb7a1346948 @list=[]> 
3.0.2 :012 > list.add_dish(burger)
 => [#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>] 
3.0.2 :013 > list.add_dish(pizza)
 => 
[#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>,
 #<Dish:0x00007fb7a293a4c0 @name="Pizza", @price=5>] 
3.0.2 :014 > list.add_dish(salad)
 => 
[#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>,
 #<Dish:0x00007fb7a293a4c0 @name="Pizza", @price=5>,
 #<Dish:0x00007fb7a134d1a8 @name="Salad", @price=2>] 
3.0.2 :015 > list.add_dish(dip)
 => 
[#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>,
 #<Dish:0x00007fb7a293a4c0 @name="Pizza", @price=5>,
 #<Dish:0x00007fb7a134d1a8 @name="Salad", @price=2>,
 #<Dish:0x00007fb7a204eca8 @name="Dip", @price=1>] 
```

Now, when a customer comes along, as per the user story, they can view a list of dishes with prices:
```
3.0.2 :016 > list.view
 => 
[{:name=>"Burger", :price=>3},
 {:name=>"Pizza", :price=>5},
 {:name=>"Salad", :price=>2},
 {:name=>"Dip", :price=>1}] 
```

Next, the customer can select a number of dishes they wish to order:
```
3.0.2 :017 > order = Order.new
 => #<Order:0x00007fb7a13bed30 @meal=[]> 
3.0.2 :018 > order.select(burger)
 => [#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>] 
3.0.2 :019 > order.select(salad)
 => 
[#<Dish:0x00007fb7a12f4a58 @name="Burger", @price=3>,
 #<Dish:0x00007fb7a134d1a8 @name="Salad", @price=2>] 
```
Thirdly, the customer can check the total of their order:
```
3.0.2 :020 > order.total
 => 5 
```

And finally the customer can place that order and receive a text message to say that their order will be delivered within an hour:
```
3.0.2 :021 > restaurant = Restaurant.new
 => 
#<Restaurant:0x00007fb7a2928478
... 
3.0.2 :022 > restaurant.place(order, "<my_number>")
 => "Thank you! Your order was placed and will be delivered before 09:21" 
3.0.2 :023 > 
```

## Further Thoughts

Though I have completed all four user stories there is still a lot of room for improvement. As far as object-oriented principles go there is further scope for refactoring in terms of single-responsibility. Some of the Classes and Methods could be further split up such as the Restaurant class that could be split into seperate classes for generating the message and then sending that message to Twilio. But at the moment the Restaurant class does nothing with the "order" that it receives and in a real world environment it may require a takeaway worker to check or acknowledge the order (eg checking those dishes, or the ingredients for those dishes, are complete).

I played around with saving the Twilio credentials in environment variables but I struggled to get them to work how I wanted. I found another gem that would tell Ruby to load those environment variables each time but I ran out of time and didn't implement that. As it stands the variables are stored in an extra .rb file that is excluded from git via the .ignore file. So another user of this project would have to create/replicate the twilio_credentials.rb file as follows:

```
TWILIO_ACCOUNT_SID = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.freeze
TWILIO_AUTH_TOKEN = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.freeze
FROM = '+44700013123'.freeze
```

I have also not had any time to test-drive any edge cases, such as sending an order to the restaurant with a dish that doesn't exist.

