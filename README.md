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


**How to run:**

[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> dishes = {
[2] pry(main)*   Katsu_Chicken_Wrap: 4.50,  
[2] pry(main)*   Roast_and_Toast_Small_Box: 3.99,  
[2] pry(main)*   Roast_and_Toast_Big_Boy_Box: 4.99  
[2] pry(main)* }  

[4] pry(main)> menu = Menu.new(dishes: dishes)

[5] pry(main)> takeaway = Takeaway.new(menu: menu)

[6] pry(main)> takeaway.show_menu
=> "Katsu Chicken Wrap - £4.50, Roast and Toast Small Box - £3.99, Roast and Toast Big Boy Box - £4.99"

[7] pry(main)> takeaway.place_order(Katsu_Chicken_Wrap: 5)
=> "Your total is £22.50"

**My process:**
