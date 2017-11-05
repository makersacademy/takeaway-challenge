# Takeaway Challenge

[Task](#task) | [Approach](#approach) | [Execution](#execution) | [Struggles](#struggles) | [Demo](#demo) | [Technologies](#technologies)

## <a name"task">Task</a>

This task was completed as the weekend challenge for week 2 at Makers Academy. Following two weeks of learning how to test drive the development of Ruby programs we were asked to develop a Takeaway App. Below are the user stories we were given.

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

## <a name="approach">Approach</a>

#### Building a Picture

I really wanted to use this challenge to test myself on some of the more abstract design concepts that I'm learning are a vital part of becoming a developer. I used Domain Models to map each of the user stories into words and then diagrams, then using these to run feature tests and then unit tests using RSpec. I am finding that I am getting gradually better at this and it's certainly helping my code to become clearer

#### Twilio

This project required the addition of the Twilio Ruby Gem which allows you to receive a text message when you succesfully pay for an order via the Twilio API. Implementation of this was not too difficult thanks to the good documentation found on their website.

#### Delegation

The last week has introduced a new concept, delegation. I have therefore used this project as an opportunity to practice delegating related tasks to individual classes. To be specific, the `Takeaway` class is resonsible for providing the menu and creating new orders, the `Order` class is responsible for filling those orders and taking payment and the `Text` class provides the functionality for sending the text message once the order is complete.

## <a name="execution">Execution</a>

I have endeavoured to follow *Dont Repeat Yourself*, **DRY** and *Single Responsibility Principal*, **SRP**  at all times, extracting functions into private methods and using guard clauses where applicable. Edge cases have been accounted for through rigorous testing using doubles and method stubs. Test classes are all run in isolation.

## <a name="struggles">Struggles</a>

* Unsure as to whether testing correctly, particularly for the Takeaway class where many functions are delegated to class Order.
* Initially written without the use of the Takeaway class with all orders being made directly through class Order. I created Takeaway as a way to practice delegation and dependency injection but I'm not convinced it is necessary.
* Stubbing Text class so that texts weren't sent while conducting unit tests.

## <a name="demo">Demo</a>

Navigate into the takeaway_challenge directory and run `bundle install` to install dependencies. Then run **irb** and "require" the necessary file.

```
➜  takeaway-challenge git:(master) ✗ irb
2.4.1 :001 > require './lib/takeaway.rb'
 => true
```

Create your takeaway shop.

```
2.4.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x000000012d6f08 @order=#<Order:0x000000012d6ee0 @menu={:pizza=>5, :sausage=>3, :chicken=>4, :curry=>7, :family_deal=>15}, @current={}, @cost=0, @text=Text>>
```

View the menu and make your selections.

```
2.4.1 :003 > takeaway.menu
 => {:pizza=>5, :sausage=>3, :chicken=>4, :curry=>7, :family_deal=>15}
2.4.1 :004 > takeaway.select("chicken", 2)
2 chicken added to your order
 => 8
2.4.1 :005 > takeaway.basket
chicken - 2 x £4, Your basket total is £8 => nil
2.4.1 :006 > takeaway.select("sausage", 4)
4 sausage added to your order
 => 20
2.4.1 :007 > takeaway.basket
chicken - 2 x £4, sausage - 4 x £3, Your basket total is £20 => nil
```

Pay and receive your confirmation message! (You need to pay the full balance to be able to checkout)

```
2.4.1 :008 > takeaway.checkout(4)
RuntimeError: Please pay £20 to complete order
	from /home/lewis/Repositories/Makers_Week_2/takeaway-challenge/lib/order.rb:26:in `pay'
	from /home/lewis/Repositories/Makers_Week_2/takeaway-challenge/lib/takeaway.rb:31:in `checkout'
	from (irb):8
	from /usr/share/rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
2.4.1 :009 > takeaway.checkout(20)
Thank you! Your order will be delivered before  
```

# <a name="technologies">Technologies</a>

Development was entirely test driven using Ruby 2.4.1 and RSpec testing framework. Rubocop was used to ensure standardised code formatting. To facilitate the sending of texts following the completion of an order the Twilio API and ruby gems were used.
