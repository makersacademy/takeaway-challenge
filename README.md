Takeaway Challenge
==================

Instructions
-------
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Fork this repo
* run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

This is how an app can be used:
-------------------------------
```
2.2.3 :001 > kyotoya = Takeaway.new
2.2.3 :002 > kyotoya.open_menu
 => {'chicken gyoza' => 4.00, 'singapore fried noodles' => 7.00, 'salmon maki' => 5.50, 'kimchi' => 3.00, 'vegetable tempura' => 7.00, 'beef soup ramen' => 6.50}
2.2.3 :003 > kyotoya.order("kimchi", 3)
 => "3x kimchi(s) added to your basket."
2.2.3 :004 > kyotoya.order("salmon maki", 4)
 => "4x salmon maki(s) added to your basket."
2.2.3 :005 > takeaway.basket_summary
kimchi x3 = £1.98, salmon maki x4 = £9.95
2.2.3 :006 > kyotoya.total
 => "Total: £11.93"
2.2.3 :007 > kyotoya.checkout(11.93)
 => ""Thank you! Your order was placed and will be delivered before 10:54."
```

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
