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

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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
Feature test

```
[1] pry(main)> oliver = Order.new
=> #<Order:0x00007fb5ec205b58
 @menu= #<Menu:0x00007fb5ec204118 @items={:pappadom_preach=>0.5,:tikka_to_ride=>4.75,:livin_dhal=>3.25,:jalfrezi_rock=>5.5,:saag_ado=>3.0,:paperback_raita=>0.75,:korma_police=>4.5,:dhansak_queen=>5.0,:bhaji_trousers=>2.75,:rice_rice_baby=>2.5}, @list=#<List:0x00007fb5ec2040c8 @dishes=[], @menu=nil>>>
[2] pry(main)> oliver.see_menu
1.pappadom_preach : £0.50
2.tikka_to_ride : £4.75
3.livin_dhal : £3.25
4.jalfrezi_rock : £5.50
5.saag_ado : £3.00
6.paperback_raita : £0.75
7.korma_police : £4.50
8.dhansak_queen : £5.00
9.bhaji_trousers : £2.75
10.rice_rice_baby : £2.50
=> {:pappadom_preach=>0.5,:tikka_to_ride=>4.75,:livin_dhal=>3.25,:jalfrezi_rock=>5.5,:saag_ado=>3.0,:paperback_raita=>0.75,:korma_police=>4.5,:dhansak_queen=>5.0,:bhaji_trousers=>2.75,:rice_rice_baby=>2.5}
[3] pry(main)> oliver.add(1,4)
you have added 4 pappadom_preach to your order
=> nil
[4] pry(main)> oliver.add(8,1)
you have added 1 dhansak_queen to your order
=> nil
[5] pry(main)> oliver.add(9,2)
you have added 2 bhaji_trousers to your order
=> nil
[6] pry(main)> oliver.add(10,1)
you have added 1 rice_rice_baby to your order
=> nil
[8] pry(main)> oliver.view_order
=> [:pappadom_preach,
 :pappadom_preach,
 :pappadom_preach,
 :pappadom_preach,
 :dhansak_queen,
 :bhaji_trousers,
 :bhaji_trousers,
 :rice_rice_baby]
[9] pry(main)> oliver.check_total
=> 15.0
[10] pry(main)> oliver.complete_order(15.0)
```
