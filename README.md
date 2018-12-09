# Takeaway Challenge

Program for control of orders through a takeaway restaurant or numerous restaurants. The weekend challenge of Week 2 of Makers academy.

## Getting Started
```
takeaway.rb in terminal

```
## User stories
```
1. As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

2. As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

3. As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

4. As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
## PRY Examples
```
[1] pry(main)> require './lib/takeaway'
^[[A=> true
[2] pry(main)> Pollys = Takeaway.new('Pollys Pie Emporium')
=> #<Takeaway:0x00007f9c9707bc88
 @menu=#<Menu:0x00007f9c9707bc60 @menu={"Chicken Pie"=>5, "Beef Pie"=>6, "Liver Pie"=>3, "Steak and Kidney"=>3, "Chicken and Leak"=>6}>,
 @name="Pollys Pie Emporium">
[3] pry(main)> Pollys.display_menu
=> "Chicken Pie: £5 \nBeef Pie: £6 \nLiver Pie: £3 \nSteak and Kidney: £3 \nChicken and Leak: £6 \n"
[4] pry(main)> pie_order_1 = Pollys.create_order
=> #<Order:0x00007f9c97082df8
 @cart=[],
 @menu={"Chicken Pie"=>5, "Beef Pie"=>6, "Liver Pie"=>3, "Steak and Kidney"=>3, "Chicken and Leak"=>6},
 @takeaway=
  #<Takeaway:0x00007f9c9707bc88
   @menu=#<Menu:0x00007f9c9707bc60 @menu={"Chicken Pie"=>5, "Beef Pie"=>6, "Liver Pie"=>3, "Steak and Kidney"=>3, "Chicken and Leak"=>6}>,
   @name="Pollys Pie Emporium">>
[5] pry(main)> pie_order_1.add('Liver Pie')
=> [{"Liver Pie"=>3}]
[6] pry(main)> pie_order_1.add('Liver Pie')
=> [{"Liver Pie"=>3}, {"Liver Pie"=>3}]
[7] pry(main)> pie_order_1.add('Beef Pie')
=> [{"Liver Pie"=>3}, {"Liver Pie"=>3}, {"Beef Pie"=>6}]
[8] pry(main)> pie_order_1.finish_and_confirm
=> "Liver Pie . . . . . £3 \nLiver Pie . . . . . £3 \nBeef Pie . . . . . £6 \nThe total for your order is: £12"
[9] pry(main)> pie_order_1.complete
=> <Twilio.Api.V2010.MessageInstance account_sid: AC075335083d586d923150458c33d95328 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you for ordering from Pollys Pie Emporium, your final price is: £12 and will delivered at 23:13 date_created: 2018-12-09 22:13:01 +0000 date_updated: 2018-12-09 22:13:01 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +441233801132 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SMe505aeaba0d244aa85e56fb7e35ebb9a status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC075335083d586d923150458c33d95328/Messages/SMe505aeaba0d244aa85e56fb7e35ebb9a/Media.json"} to: +447413527942 uri: /2010-04-01/Accounts/AC075335083d586d923150458c33d95328/Messages/SMe505aeaba0d244aa85e56fb7e35ebb9a.json>
[10] pry(main)>
```


### Prerequisites

```
Terminal, ruby, git, twilio,
```

### Approach

I approached this challenge from the point of view of a justeat of a Delvieroo clone. Aiming for a program that can handle multiple orders and contain the information of each one within, including the restaurant name, menu ordered from, and the selection of the client.

Following this plan I settled on starting testing the Take away class first and let the second and third class grow from that approach. Not implementing a second class until the second user story; as it was the need to store order information that led to the creation of the second class order, which through testing and driving became the largest class but still holding its responsibilities only for the most part. it was during this process that the refactor into the menu method arose also, keeping the different classes responsible for only one part of the interaction with the customer.

I aimed to keep to the single responsibility idea throughout and met with moderate success, but sadly had to prioritise completing the assignment as a whole rather than break down the classes further.(Notes on my suggested refactoring can be read below).

I soon came across the factory pattern of class creation and followed it closely to create a class takeaway that acts as a factory for orders to one restaurant or (multiple with just a little work).

Chronologically I followed the user stories above top to bottom and allowed my program to grow from these needs. My approach changing somewhere during the second user story to focus on the justeat and deliveroo as inspiration for this task.

Finally I decided on using a module rather than a class for the twilio API interface as I feel this code will be better as a reusable block on other programs, as such I adjusted the complete method to take a text as an argument rather than hard code a text message into the module. Because of this approach my test coverage falls to just below %30 as currently the module is part of the lib. This requires further research, the results of which will likely be seen in later projects.


### How I move forward with this project

Moving forward I would improve the Menu class as a priority. Currently the menu for 'Pollys Pie Emporium' is hardcoded into new menu instances. Ideally I would like to work this class to be able to store different menus for different restaurants. e.g. lunch menu, special menu etc. As well as be able to update current menu's stored. I would have most likely taken an file based approach using CSV's to keep menu's and load them when needed.

Beyond the menu class I would update the existing user feedback loops to give them better feedback at point of order as well as a point of sale final confirmation. Along with working on the format of the current feedbacks found in the finish_and_confirm method.

#### Refactoring to be done Code

- The menu class would be refactored into two classes, Menu and Menu item. As it stands menu is responsible for both presenting the menu and controlling whats on it. This responsibility could be moved and allow for easier use later on of menu changing methods.
- Currently the summary, and total methods are ugly, the nested each methods while beautiful in their simplicity I feel could be reworked and perhaps some of the methods split into further private methods.
- The send SMS module would be reworked to be made more general use friendly. This requires further research into ruby implementation of twilio API.
- The order class is very large and it could be argued that it should be shortened. Perhaps the extraction of certain methods could be done to create an order log class, logging the orders for one restaurant and letting the order class work only to update this class. In effect placing another level between takeaway and order classes.

#### Refactoring and changes to be done tests

- One test was identified as vacuous after the final tests for user story 4 were completed. This test was adjusted throughout the program due to method name changes and the such and as such it continued to pass despite not testing much. This test is identified via comments in the takeaway_spec file.
- I have currently only used one double throughout my tests for the send sms module. I feel perhaps more could be used to test in isolation, however all tests currently pass at an acceptable level so this would be potentially an academic exercise.
-Menu spec would be given more tests to test ability to hold multiple menus, declare menus and the such in order to test drive the development of this class.

## Authors


* **Georges Le Vaillant** - [GLV](https://github.com/stonefarmer9)



## Acknowledgments

* Makers Academy
