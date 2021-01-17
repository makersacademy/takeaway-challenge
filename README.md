Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | Anna's|   ))))
          |_)//(''''':      | Eats  |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

The code in this repo fulfils the following user stories.

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
I didn't get to the Twilio functionality but plan to implement it later in the week.

Here is an example irb extract:
```ruby
2.6.5 :001 > t = Takeaway.new
 => #<Takeaway:0x00007fe529127c88 @menu=#<Menu:0x00007fe529127c60 @dishes={"Buffalo chicken burger"=>12, "Angus beef burger"=>14, "Plantastic burger"=>8, "Chips"=>3, "Shoestring fries"=>3, "Coke"=>2}>, @basket=[]>
2.6.5 :002 > t.show_menu
{"Buffalo chicken burger"=>12, "Angus beef burger"=>14, "Plantastic burger"=>8, "Chips"=>3, "Shoestring fries"=>3, "Coke"=>2} => nil
2.6.5 :003 > t.add "Chips", 3
3x chips(s) added to your basket. => nil
2.6.5 :004 > t.basket
 => [{"Chips"=>3, "count"=>3}]
2.6.5 :005 > t.complete_order
You have ordered:
3 chips(s)
Total: £9
```
