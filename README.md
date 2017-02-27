Maker's Weekend Challenge 2: Takeaway Challenge
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
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
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
## Approach

To tackle the above task, I took the user stories above and created a domain model which set out 4 classes: Takeaway, Menu, Order and TextConfirmation. Takeaway delegated methods and tasks to each of the other classes to fulfil the user stories.

I attempted to set up feature tests fulfilling the above user stories in their own spec (feature_spec.rb). I understood this is best practice, however, found some limitations in my approach which meant the feature tests did not all pass/are not all active. Given more time I would go over this to ensure they pass.

## How to run

```
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fef0421ed50 @menu=#<Menu:0x007fef0421ed28>, @order=#<Order:0x007fef0421ed00 @menu=#<Menu:0x007fef0421ecd8>, @current_order=[], @bill=0, @string_summary="">, @text_confirmation=#<TextConfirmation:0x007fef0421ec38>>
2.3.1 :003 > takeaway.read_menu
 => {"Spring rolls"=>2.5, "Pho"=>7.0, "Tofu stirfry"=>8.5}
2.3.1 :004 > takeaway.make_selection('Spring rolls')
 => "Order received for 1 Spring rolls."
2.3.1 :005 > takeaway.make_selection('Tofu stirfry', 3)
 => "Order received for 3 Tofu stirfry."
2.3.1 :006 > takeaway.order_summary
 => " Spring rolls x 1: £2.50 | Tofu stirfry x 3: £25.50 |"
2.3.1 :007 > takeaway.place_order
```

## Limitations/Improvements

- I would implement greater testing of behaviours, rather than states
- I would make improvements to checking the bill against running total
- Ensure numbers are rounded to two decimals to reflect real-life currency
