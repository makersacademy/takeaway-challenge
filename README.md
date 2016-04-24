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

Instructions
-------

```sh
2.3.0 :001 > require './lib/takeaway'
 => true
2.3.0 :002 > t = Takeaway.new
 => #<Takeaway:0x007fd3621b1628 @menu=#<Menu:0x007fd3621b1600 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @order=#<Order:0x007fd3621b1588 @dishes={}, @menu=#<Menu:0x007fd3621b1600 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>>>
2.3.0 :003 > t.print_menu
 => "spring roll £0.99, char sui bun £3.99, pork dumpling £2.99, peking duck £7.99, fu-king fried rice £5.99"
2.3.0 :004 > t.place_order("spring roll", 10)
 => 9.9
2.3.0 :005 > t.place_order("peking duck", 1)
 => 17.89
 ```

User Stories
-----

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
------------------

My Solution
-----

I really struggled with this week's challenge and had to reply on using google, the walkthrough and various pull requests to even make sense of what I was trying to do. I am going to spend time on it throughout this week in order to try to improve and take something positive forward.