Takeaway Challenge
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

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
My approach to this user story was to create a Menu class whereby a user can pass in a hash with the dishes and their prices as an argument upon initialization.

As shown in IRB:
```
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fa5aa1bf768 @list={"chicken korma"=>5.7, "chicken bhuna"=>6.7, "lamb rogan josh"=>6.5, "lamb madras"=>5.8, "king prawn dhansak"=>7.7, "plain rice"=>1.9, "pilau rice"=>2.0, "bombay aloo"=>3.25, "tarka daal"=>3.25, "plain naan"=>2.5, "garlic naan"=>2.75, "peshwari naan"=>3.0}, @selection=[]>
2.5.0 :003 > menu.list
 => {"chicken korma"=>5.7, "chicken bhuna"=>6.7, "lamb rogan josh"=>6.5, "lamb madras"=>5.8, "king prawn dhansak"=>7.7, "plain rice"=>1.9, "pilau rice"=>2.0, "bombay aloo"=>3.25, "tarka daal"=>3.25, "plain naan"=>2.5, "garlic naan"=>2.75, "peshwari naan"=>3.0}
2.5.0 :005 >
```

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
For this user story I decided to keep the selection of the menu items in the same class as the displayed menu. This was partly because I wanted to experiment with classes interacting with each other later on.

In hindsight, however, this over complicated things!

In IRB:
```
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fa5aa1bf768 @list={"chicken korma"=>5.7, "chicken bhuna"=>6.7, "lamb rogan josh"=>6.5, "lamb madras"=>5.8, "king prawn dhansak"=>7.7, "plain rice"=>1.9, "pilau rice"=>2.0, "bombay aloo"=>3.25, "tarka daal"=>3.25, "plain naan"=>2.5, "garlic naan"=>2.75, "peshwari naan"=>3.0}, @selection=[]>
2.5.0 :004 > menu.list
 => {"chicken korma"=>5.7, "chicken bhuna"=>6.7, "lamb rogan josh"=>6.5, "lamb madras"=>5.8, "king prawn dhansak"=>7.7, "plain rice"=>1.9, "pilau rice"=>2.0, "bombay aloo"=>3.25, "tarka daal"=>3.25, "plain naan"=>2.5, "garlic naan"=>2.75, "peshwari naan"=>3.0}
2.5.0 :005 > menu.select_item('chicken korma')
 => [["chicken korma", 5.7]]
2.5.0 :006 > menu.select_item('plain naan')
 => [["chicken korma", 5.7], ["plain naan", 2.5]]
2.5.0 :007 > menu.select_item('pilau rice')
 => [["chicken korma", 5.7], ["plain naan", 2.5], ["pilau rice", 2.0]]
2.5.0 :008 > menu.selection
 => [["chicken korma", 5.7], ["plain naan", 2.5], ["pilau rice", 2.0]]
```

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
For this user story I decided to create a new Order class which would handle the order itself and displaying a total.

I decided it would print a bill out with the items, their quantities, the item sum and a final total.

In IRB:
```
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > require './lib/order'
 => true
2.5.0 :004 > menu = Menu.new
 => #<Menu:0x00007fa45a8fd2b0 @list={"chicken korma"=>5.7, "chicken bhuna"=>6.7, "lamb rogan josh"=>6.5, "lamb madras"=>5.8, "king prawn dhansak"=>7.7, "plain rice"=>1.9, "pilau rice"=>2.0, "bombay aloo"=>3.25, "tarka daal"=>3.25, "plain naan"=>2.5, "garlic naan"=>2.75, "peshwari naan"=>3.0}, @selection=[]>
2.5.0 :005 > menu.select_item('plain naan')
 => [["plain naan", 2.5]]
2.5.0 :006 > menu.select_item('pilau rice')
 => [["plain naan", 2.5], ["pilau rice", 2.0]]
2.5.0 :007 > menu.select_item('plain naan')
 => [["plain naan", 2.5], ["pilau rice", 2.0], ["plain naan", 2.5]]
2.5.0 :008 > menu.select_item('chicken korma')
 => [["plain naan", 2.5], ["pilau rice", 2.0], ["plain naan", 2.5], ["chicken korma", 5.7]]
2.5.0 :009 > menu.select_item('plain naan')
 => [["plain naan", 2.5], ["pilau rice", 2.0], ["plain naan", 2.5], ["chicken korma", 5.7], ["plain naan", 2.5]]
2.5.0 :010 > order = Order.new(menu.selection)
 => #<Order:0x00007fa45c321d30 @basket=[["plain naan", 2.5], ["pilau rice", 2.0], ["plain naan", 2.5], ["chicken korma", 5.7], ["plain naan", 2.5]], @total=0, @final_bill=[], @send_sms=#<SendSms:0x00007fa45c321d08>>
2.5.0 :011 > order.show_order
plain naan quantity: 3 price: 7.5
pilau rice quantity: 1 price: 2.0
chicken korma quantity: 1 price: 5.7
total: 15.2
```

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
For this user story I created a new class which used the Twilio gem to send a text message with a time delivery slot of one hour.

In IRB:
```
2.5.0 :011 > order.show_order
plain naan quantity: 3 price: 7.5
pilau rice quantity: 1 price: 2.0
chicken korma quantity: 1 price: 5.7
total: 15.2
 => nil
2.5.0 :013 > order.confirm!
 => <Twilio.Api.V2010.MessageIns....
```
