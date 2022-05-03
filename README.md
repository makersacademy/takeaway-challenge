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

Status -> Work in Progress
-------

* takeaway currently doesn't allow dishes to be deleted from order -> needs to be updated
* takeaway currently doesn't check for availability -> needs to be updated
* sms function currently not working
* classes need restructuring
* tests need updating
* rafactoring needed

Navigate
-----

```
laura@Lauras-Air takeaway-challenge % irb
 => 
#<TakeAway:0x000000014fa299f0
... 
3.0.2 :002 > take.view_menu
["1. Mattar Paneer £12.5",
 "2. Black Daal £7.5",
 "3. Raita £3.5",
 "4. Garlic Naan £3.5"] 
3.0.2 :003 > take.add_dish(1, 1)
 => ["1 x Mattar Paneer £12.5/each, has been added to your order -> £[12.5]"] 
3.0.2 :004 > take.add_dish(2, 1)
 => ["1 x Black Daal £7.5/each, has been added to your order -> £[7.5]"] 
3.0.2 :005 > take.add_dish(4, 1)
 => ["1 x Garlic Naan £3.5/each, has been added to your order -> £[3.5]"] 
3.0.2 :006 > take.add_dish(4, 2)
 => ["2 x Garlic Naan £3.5/each, has been added to your order -> £[7.0]"] 
3.0.2 :007 > take.add_dish(2, 1)
 => ["1 x Black Daal £7.5/each, has been added to your order -> £[7.5]"] 
3.0.2 :008 > take.view_basket
 => 
["1 x Mattar Paneer £12.5/each -> £[12.5]",
 "2 x Black Daal £7.5/each -> £15.0",
 "3 x Garlic Naan £3.5/each -> £10.5"] 
3.0.2 :009 > take.order_total
 => "Your order total is £38.0" 
```

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Takeaway program with the following user stories:

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