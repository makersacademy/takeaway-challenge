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

Class Diagram
-------

| Menu           | Order          |
| :------------- | :------------- | :------------- | :------------- |
| @dishes        | Item Two       |
| @dish_list     | Item Two       |
| :------------- | :------------- | :------------- | :------------- |
| #list_dishes   | Item Two       |
| #order         | Item Two       |


Place the order by giving the list of dishes, their quantities and a number that should be the exact total.

If the sum is not correct the method should raise an error

otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
