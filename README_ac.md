Takeaway Challenge (INCOMPLETE)
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


Task
Write a takeaway challenge based on following user stories
-----

To run this program, users can use either `irb` or `pry`.

Files required to start the program:
```ruby
require './lib/menu.rb'
require './lib/order.rb'
require './lib/takeaway.rb'
```

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```
```ruby
takeaway = Takeaway.new(menu:menu, order:order)
takeaway.read_menu
# => "Margherita £4.00, Capricciosa £4.50"
```

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```ruby
order.add("margherita", 2)
# => 2
order.add("hawaii", 1)
# RuntimeError: Hawaii is not on our menu, please select another item.
```


```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```ruby
order
# => #<Order:0x00007f8a6502fd90 @basket={"margherita"=>2}, @menu=#<Menu:0x00007f8a6502ff48 @dishes={"margherita"=>4, "capricciosa"=>4.5}>>
takeaway.total_amount
=> 8
takeaway.finalise_order(8)
# => #<Order:0x00007f8a6502fd90 @basket={"margherita"=>2}, @menu=#<Menu:0x00007f8a6502ff48 @dishes={"margherita"=>4, "capricciosa"=>4.5}>>
takeaway.finalise_order(7)
# RuntimeError: The total amount is not correct.
```

When total amount is correct, the program currently returns the order. Once the sms functionality is sorted, if amount is correct, ```Takeaway#finalise_order``` should then send a text.

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

I have not managed to implement this functionality.

## Resources
- [Leo Allen's tutorial](https://www.youtube.com/watch?v=mgiJKdH9x8c): very useful input on how to model the domain.
- Looking at former and senior Makers students' repos has also been very helpful.


## Reflections
This weekend challenge seemed to be much easier to approach, compared to the Airport challenge. Despite feeling more and more comfortable with the concepts learned during the first two weeks, I still heavily rely on walkthroughs and bits of codes from other students. I am confident with reading and understanding code, however I still struggle with writing codes from scratch. The implementation of the text_sender turned out to be quite challenging. As I did not fully understand it, I decided to leave the challenge incomplete instead of just copying and pasting code from the walkthrough. Hopefully there will be time to go over it again during the next days.

## Things I need to improve
- Domain modelling
- Writing code without looking too much at walkthroughs
