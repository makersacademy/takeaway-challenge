# Takeaway Challenge

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

This program models a system to order food from a takeaway. Currently it does not support the use of the SMS confirmation from twilio's API. It is not protected against edge cases, such as if item is not on the menu or item quantity too high. I look to finish this project during week 3 of the Makers course.

## Installation

```
git clone https://github.com/cms718/takeaway-challenge.git
bundle
```

## Usage

```
2.6.5 :001 > require './lib/takeaway.rb'
 => true
2.6.5 :002 > kfc = Menu.new([{name: "chicken", price: 5, quantity: 100}, {name: "chips", price: 1.5, quantity: 200}])
 => #<Menu:0x00007fbd770c2c18 @items=[{:name=>"chicken", :price=>5, :quantity=>100}, {:name=>"chips", :price=>1.5, :quantity=>200}]>
2.6.5 :003 > takeaway = Takeaway.new(kfc)
 => #<Takeaway:0x00007fbd7888dc08 @menu=#<Menu:0x00007fbd770c2c18 @items=[{:name=>"chicken", :price=>5, :quantity=>100}, {:name=>"chips", :price=>1.5, :quantity=>200}]>, @order=#<Order:0x00007fbd7888daf0 @current=[]>>
2.6.5 :004 > takeaway.add("chips", 4)
 => "4 x chips added"
2.6.5 :005 > takeaway.add("chicken", 2)
 => "2 x chicken added"
2.6.5 :006 > takeaway.display_order
 => "4 x chips = £6.0 2 x chicken = £10"
2.6.5 :007 > takeaway.total
 => "£16.0"
2.6.5 :008 > takeaway.complete
 => "Order has been placed for £16.0"
```
