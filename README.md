[![Build Status](https://travis-ci.org/MisaOgura/airport_challenge.svg?branch=master)](https://travis-ci.org/MisaOgura/airport_challenge) [![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=mohamedIssaq)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=mohamedIssaq)

##### Makersacademy Week2 - Takeaway Challenge

### GOCHISO
* Has your *restaurant business* been successful?
* Have you ever asked by customers for an easy-to-use *delivery service?*
* It is time to meet their needs by start using **GOCHISO**!

### Introduction
GOCHISO ('feast' in Japanese) provides hungry & anxious customers an easy-to-use interface to order tonight's dinner. Not only some delicious goodies but also it gives them a peace of mind! Upon order confirmation, customers are notified of the estimate delivery time via an automatic text messaging service.

### Development
GOCHISO is written in Ruby version 2.2.3 and has been developed using RSpec version 3.2.2 as a platform for behaviour-driven development (BDD). The continuous integration is assessed through Travis-CI with the latest test coverage of 100%. Text messaging service is provided by Twilio.

### Design
The design of GOCHISO involves 3 classes: Takeaway, Menu and Basket. The Takeaway class serves as an interface, interacting with other 2 classes to provide flawless and flexible application. The separation of these classes will allow the programme to adapt to any menus should you wish to add more dishes to your service.

### Flowchart of ordering process

```
.           Takeaway is initiated
                      ↓
     User adds/removes dish with quantity
                      ↓
  Price of the dish is added from Menu class
                      ↓
              Basket is updated
                      ↓
        User pays and places an order
                      ↓
      User receives a text confirmation

```

### Demonstration
Below is a demonstration of the programme using Interactive Ruby Shell (irb).

```
2.2.3 :001 > dinner = Takeaway.new

2.2.3 :002 > puts dinner.menu.list
miso soup: £1.5
sticky rice: £2
tofu salad: £4.5
sushi: £7
okonomi-yaki: £10
tonkotsu ramen: £12
katsu curry: £12

2.2.3 :003 > dinner.add('sticky rice', 3)
2.2.3 :004 > dinner.add('katsu curry', 2)
2.2.3 :005 > dinner.add('sushi', 4)

2.2.3 :006 > dinner.basket.content
 => [{:name=>"sticky rice", :amount=>3, :price=>2},
     {:name=>"katsu curry", :amount=>2, :price=>12},
     {:name=>"sushi", :amount=>4, :price=>7}]

2.2.3 :007 > dinner.remove('sticky rice', 2)

2.2.3 :008 > dinner.basket.content
 => [{:name=>"sticky rice", :amount=>1, :price=>2},
     {:name=>"katsu curry", :amount=>2, :price=>12},
     {:name=>"sushi", :amount=>4, :price=>7}]

2.2.3 :009 > dinner.add('tofu salad', 2)
2.2.3 :010 > dinner.remove('sticky rice')

2.2.3 :011 > dinner.basket.content
 => [{:name=>"katsu curry", :amount=>2, :price=>12},
     {:name=>"sushi", :amount=>4, :price=>7},
     {:name=>"tofu salad", :amount=>2, :price=>4.5}]

2.2.3 :012 > dinner.place_order(61)
 => "Confirmation text sent"

<Text message sent to the customer>
"Thank you! Your order was placed and
will be delivered before --:--"
```

### Authour
Misa Ogura
