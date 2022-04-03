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

This Takeaway challenge allows customers to place a food order and have it delivered within 1 hour of order confirmation.

As a customer, you will be able to select dishes, remove dishes, view the menu and check your order & total.

## Intructions

- Open this program in IRB to get started (require ./lib/takeaway')
- To view the menu - 'view_menu'
- To select a dish - 'select_dish('dish')
- To delete an item from your order - 'delete_item('item')
- To check the inventory and total of your order - 'check_order'
- To complete your order - 'place_order'

```
3.0.2 :002 > t = Takeaway.new
 => #<Takeaway:0x00007ff76e136060 @clients_order=[]>
3.0.2 :003 > t.view_menu
 => "Samosas - £5, Ice Cream - £3, Fries - £5, Celery Juice - £5, Apple Pie - £7, Pizza - £15, Coffee - £4"
3.0.2 :004 > t.select_dish("Samosas")
 => ["Samosas"]
3.0.2 :005 > t.select_dish("Fries")
 => ["Samosas", "Fries"]
3.0.2 :006 > t.select_dish("Celery Juice")
 => ["Samosas", "Fries", "Celery Juice"]
3.0.2 :007 > t.delete_item('Celery Juice')
 => "Celery Juice"
3.0.2 :008 > t.check_order
 => "Your selected items are Samosas - £5, Fries - £5, and the total is £10"
3.0.2 :09 > t.place_order
Your order has been placed successfully. You will receive a text confirmation shortly.
```

## User Stories

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


