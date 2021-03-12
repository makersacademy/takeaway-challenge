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



#### User stories
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

#### Domain Model

| Class      | Properties            | Methods               |
|------------|-----------------------|-----------------------|
| Restaurant | @name                 | view_menu             |
|            | @menu = []            | place_order           |
|            |                       | choose_dish(dish_num) |
|            |                       |                       |
| Order      | @order name/number    | view_basket           |
|            | @basket = []          | calculate_total       |
|            | @prices = []          | total_correct?        |
|            |                       | complete_order        |


Optional extras:
add_to_menu
take_off_menu
dish_not_available

additional notes:
* menu is currently hardcoded to one menu list that initializes with every new restaurant instance


#### IRB testing
