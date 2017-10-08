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
My Approach
-------
* Write some stuff

The Brief
-------

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

Functionality
-----
```sh
[1] pry(main)> eat = TakeAway.new
=> #<TakeAway:0x00007fc4195954e0 @basket={}, @menu= #<Menu:0x00007fc4195954b8
   @dishes = {"sushi"=>5.99,
     "pizza"=>7.99,
     "burger"=>4.99,
     "pie"=>15.99,
     "water"=>2.99,
     "beer"=>3.99 }>>
[2] pry(main)> eat.order 'sushi'
=> "You've added 1 sushi dish to your basket"
[3] pry(main)> eat.empty_basket
=> "Your basket is now empty"
[4] pry(main)> eat.order 'pie', 2
=> "You've added 2 pie dishes to your basket"
[5] pry(main)> eat.order 'pizza'
=> "You've added 1 pizza dish to your basket"
[6] pry(main)> eat.show_basket
=> "pie x 2 = £31.98, pizza x 1 = £7.99"
[7] pry(main)> eat.order_total
=> "Your total is: £39.97"
[8] pry(main)> eat.complete_order(35.99)
RuntimeError: Sorry the amount given is incorrect
[9] pry(main)> eat.complete_order(39.97)
=> {}
```


* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
