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

How to run the program
-------

Please run the program in irb like the following:

```
2.6.5 :001 > require './lib/takeaway'
 
2.6.5 :002 > t = Takeaway.new
 => #<Takeaway:0x00007f7fa40e4b80 @dishes=#<Restaurant:0x00007f7fa40e4b30 @menu={:burgers=>3.0, :falafel=>4.5, :burrito=>6.5, :lasagna=>7.0, :quiches=>5.5}>, @basket=[]> 
 
2.6.5 :005 > t.read_menu

+==============================+
 Welcome to Ara's Vegan Canteen 
+==============================+
       item      |     price   |
 ---------------- -------------- 
|     burgers    |      3.0    |    
|     falafel    |      4.5    |    
|     burrito    |      6.5    |    
|     lasagna    |      7.0    |    
|     quiches    |      5.5    |    

 2.6.5 :003 > t.order "burgers"
1x burgers added to your basket.

2.6.5 :004 > t.order "burrito", 2
2x burrito added to your basket.

2.6.5 :007 > t.basket_summary
 => {:burgers=>3.0, :burrito=>13.0} 
 
 2.6.5 :009 > t.checkout(19)
=> RuntimeError (Incorrect total provided. Basket total is 16.0)

2.6.5 :010 > t.checkout(16)
Successfully placed the order. A text confirmation will be sent to you shortly.

A twilio message is sent with the following message "Thank you! Your order was placed and will be delivered before 11.41 (real local time + 1)"

```

My approaches
-------
- I used feature test in irb to plan the required methods and interaction with the user
- I wrote unit tests, starting with simple ones like selecting dishes, adding them to the basket and ending with testing sending SMS functionality
- I used Twilio to send text once order is placed
- Twilio was stubbed in unit testing but using it in IRB actually sends the confirmation test

Other notes
-------
- I was unable to use mock in every test as I should but I plan to refactor them accordingly once I develop more familiarity with mocking and stubbing
