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
 ```
 [1] pry(main)> require './lib/takeaway.rb'
=> true
[2] pry(main)> ta = Takeaway.new
=> #<Takeaway:0x00007fb866008798
 @bill=#<Bill:0x00007fb866008518>,
 @menu=
  #<Menu:0x00007fb866008770
   @order=
    #<Order:0x00007fb866008608 @dishes={"sweet and sour tofu"=>5, "singapore noodles"=>3, "szechuan tofu"=>5, "rice"=>1}, @total=[]>>>
[3] pry(main)> ta.menu.place_order("rice", 3)
=> [3]
[4] pry(main)> ta.menu.place_order("singapore noodles", 1)
=> [3, 3]
[5] pry(main)> ta.menu.total
=> 6
[6] pry(main)> ta.confirm_order
SM3d7a7dd381724bd2ab358b68f19284be
=> nil
```

My Approach
-------

To begin I spent much more time working with the User Stories and developing a Domain Model than last week.
This allowed me to think about delegation and single responsibility more clearly.
I used feature testing extensively before trying to develop unit tests, meaning I new exactly what I wanted my unit tests to test for.
This stronger planning process meant that my actual code developed more quickly than in the last challenge. 
