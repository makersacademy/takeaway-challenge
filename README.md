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

Purpose
------------------
A takeaway app, that allows customers to view food options from a menu, place an order and receive an SMS confirming their order.


User Stories
------------------

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

Solution Approach
------------------
Takeaway serves as the main class, and point of entry - it loads a menu on creation, controls the viewing of menus and ordering of food

How to Use
------------------
#####0. Menu is created for the restaurant
```
ᚹᚱᛘ ᛬ require './lib/takeaway'
=> true
ᚹᚱᛘ ᛬ dishes = {"Spag_Bol"=>6.5, "Pizza"=>4, "Chips"=>2.75}
=> {"Spag_Bol"=>6.5, "Pizza"=>4, "Chips"=>2.75}
ᚹᚱᛘ ᛬ menu = Menu.new(dishes)
=> #<Menu:0x007fd59b988910
 @menu_list={"Spag_Bol"=>6.5, "Pizza"=>4, "Chips"=>2.75}
 ```

#####1. User finds takeaway restaurant
```
ᚹᚱᛘ ᛬ t = Takeaway.new(menu, SMS)
=> #<Takeaway:0x007fd59b192e40
 @menu=
  #<Menu:0x007fd59b988910
   @menu_list={"Spag_Bol"=>6.5, "Pizza"=>4, "Chips"=>2.75}>,
 @message_type=SMS>
```

#####2. User views the menu
 ```
ᚹᚱᛘ ᛬ t.read_menu
Spag_Bol 6.50
Pizza 4.00
Chips 2.75
```

#####3. User selects items to add to their basket
```
ᚹᚱᛘ ᛬ t.select_item("Pizza")
=> "1x Pizza added to your basket"
ᚹᚱᛘ ᛬ t.select_item("Chips", 3)
=> "3x Chips added to your basket"
```

#####4. User views items in their basket
```
ᚹᚱᛘ ᛬ t.view_basket
1x Pizza @ £4.00
3x Chips @ £2.75
Total: £12.25
```

#####5. User confirms order with correct total
```
ᚹᚱᛘ ᛬ t.confirm_order(12.25)
=> "Thank you for your order: £12.25"
```

#####6. User is sent an SMS confirmation message
