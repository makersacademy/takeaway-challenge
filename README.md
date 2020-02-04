### [Makers Academy](http://www.makersacademy.com) - Week 2 Weekend Project 

# Takeaway Challenge 🥡

| [Task](#Task) | [Installation Instructions](#Installation) | [Feature Tests](#Feature_Tests) | [User Stories](#Story) | [Objects & Methods](#Methods) | [Testing](#Testing) | [Further improvements](#Further_Improvements)

![takeaway](takeaway.jpg)

## <a name="Task">Task</a>

Write a Takeaway program that allows customers to see a list of dishes and prices, select quantitites, check order totals and receive a confirmation text.

This challenge is the second weekend challenge at [Makers Academy](https://github.com/makersacademy).

## <a name="Installation">Installation Instructions</a>

1. Fork this repository, clone to your local machine then change into the directory:
```
$ git clone git@github.com:davmcgregor/takeaway-challenge.git
$ cd takeaway-challenge
```
2. Load dependencies with bundle:
```
$ gem install bundle
$ bundle
```
3. Run the app in the terminal:

```Shell
$ irb
> require './lib/takeaway_challenge.rb'
```

## <a name="Feature_Tests">Feature Tests (How it works)</a>

```
 > Takeaway.new.menu_list
 => {"Banitsa"=>3, "Cake"=>4, "Milkshake"=>2, "Cheeseburger"=>6, "Dumplings"=>5} 
```
To view the menu, use the Takeaway menu_list instance variable
```
> order = Order.new
> order.make_order
```
To order an item use make_order on an instance of Order,and follow prompts to select items and quantitys. A confirmation text will be sent upon completion of an order.
```
>order.order_summary
10 x Cake
5 x Milkshake
Coming to a total of: £50
```
Use order_summary to view the quanity of items ordered and the total price.
```
> order.verify
 => "Your order total matches the sum of dishes"
```
Use order.verify to confirm the total price matches the sum of each dish ordered.

## <a name="Story">User Stories</a>
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
## <a name="Methods">Objects & Methods</a>

For the user stories I created a domain model for each object, including attributes and behaviour:

### Takeaway

| Methods | Description |
| --- | --- |
| Takeaway.new | Creates a new instance of Takeaway |
| .menu_list | Instance variable that shows menu items and prices |

### Order

| Methods | Description |
| --- | --- |
| Order.new | Creates a new order, sets bastket, total and menu instance variables |
| .make_order | Prompts the user through a loop to select menu items, quantities, and to confirm the order |
| .add_item(item, quantity) | Send uder input to the basket hash, and increments to the total variable |
| .order_summary | Prints a list of dishes, quantities and the final order total |
| .confirm | Seeks uder input to confirm final order |
| .send_confirmation | Sends a confirmation text to the user |
| .verify | Tells the user whether the order total matches the sum of dish prices |

### Message

| Methods | Description |
| --- | --- |
| .send(message) | Send a text confirmation via the Twilio API, with the message attribute comprising the body of the text|

## <a name="Testing">Testing</a>

Tests were written with RSpec. To run the tests in terminal: 

```bash
$> cd takeaway-challenge
$> rspec
```

## <a name="Further_Improvements">Further Improvements</a>
* Attempt the advanced section: [Implement the ability to place orders via text message
* Ensure ENV variables are functioning
* Refactor methods identified as too long by Rubocop
* Refactor and add testing for all methods, including #order_summary, #confirm, #send_confirmation etc.
* Update README
