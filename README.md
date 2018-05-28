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
 
 ##### week 2 weekend challenge Makers Academy
IRB

```
 2.5.0 :002 > require './lib/take_away.rb'
 => true
2.5.0 :003 > takeway = TakeAway.new
 => #<TakeAway:0x00007f839aa37e18 @menu={"Goi Ga"=>5.99, "Cha Gio"=>4.99, "Vietnamese dumpling"=>2.99, "peking duck"=>5.0, "Pho Bo"=>6.99}>
2.5.0 :004 > takeway.read_menu
 => {"Goi Ga"=>5.99, "Cha Gio"=>4.99, "Vietnamese dumpling"=>2.99, "peking duck"=>5.0, "Pho Bo"=>6.99}
2.5.0 :005 > order = Order.new
 => #<Order:0x00007f839aa1bd80 @basket=[], @total=0, @menu={"Goi Ga"=>5.99, "Cha Gio"=>4.99, "Vietnamese dumpling"=>2.99, "peking duck"=>5.0, "Pho Bo"=>6.99}>
2.5.0 :006 > order.order("peking duck", 2)
 => "2X peking duck added to your basket"
2.5.0 :007 > order.order("Pho Bo", 4)
 => "4X Pho Bo added to your basket"
2.5.0 :008 > order.basket
 => ["peking duck X 2 = £10.0", "Pho Bo X 4 = £27.96"]
2.5.0 :009 > order.receipt
 => "peking duck X 2 = £10.0\nPho Bo X 4 = £27.96\n Total = 37.96"
```


#### User stories

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


