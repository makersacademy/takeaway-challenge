Takeaway Challenge [![Build Status](https://travis-ci.org/amaalali/takeaway-challenge.svg?branch=master)](https://travis-ci.org/amaalali/takeaway-challenge)
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

Usage Test
-------

```
[1] pry(main)> require './lib/restaurant'
=> true
[2] pry(main)> bobs = Restaurant.new
=> #<Restaurant:0x007fee11870698
 @cart=#<Cart:0x007fee118485d0 @current_order=[]>,
 @menu=
  #<Menu:0x007fee118705f8
   @menu=
    [{:dish=>"Doubles", :price=>4.0},
     {:dish=>"Callaloo", :price=>1.0},
     {:dish=>"Curry duck", :price=>1.75},
     {:dish=>"Chips", :price=>3.0},
     {:dish=>"Fried Fish", :price=>5.5},
     {:dish=>"Water", :price=>10.0}]>,
 @total=0>
[3] pry(main)> bobs.read_menu
1. Doubles ... £4.00
2. Callaloo ... £1.00
3. Curry duck ... £1.75
4. Chips ... £3.00
5. Fried Fish ... £5.50
6. Water ... £10.00
=> "To add an item to your cart type 'resturant_name.select(item_number, quantity)'"
[4] pry(main)> bobs.select(1,2)
=> [{:dish=>"Doubles", :price=>4.0, :quantity=>2}]
[5] pry(main)> bobs.select(2,3)
=> [{:dish=>"Doubles", :price=>4.0, :quantity=>2}, {:dish=>"Callaloo", :price=>1.0, :quantity=>3}]
[6] pry(main)> bobs.select(6,1)
=> [{:dish=>"Doubles", :price=>4.0, :quantity=>2}, {:dish=>"Callaloo", :price=>1.0, :quantity=>3}, {:dish=>"Water", :price=>10.0, :quantity=>1}]
[7] pry(main)> bobs.total
=> "Your total is £21.00"
[8] pry(main)> bobs.cart
=> [{:dish=>"Doubles", :price=>4.0, :quantity=>2}, {:dish=>"Callaloo", :price=>1.0, :quantity=>3}, {:dish=>"Water", :price=>10.0, :quantity=>1}]
[9] pry(main)> bobs.total
=> "Your total is £21.00"
[10] pry(main)> bobs.place_order```

```
