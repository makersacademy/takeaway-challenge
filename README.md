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

###how to use me

The order.rb file has been created to work in irb. to use it, you should open your terminal
and enter the following command

```
irb -r ./lib/order.rb
```

Once the file is loaded we are ready to rock!
You first need to set a variable to be represent the order.

```
chinese = Order.new
```

From here you can view the menu, to do this you just do the following

```
chinese.view
```

When you are ready to order you can use the following command

```
chinese.order(1,3)
```

The first argument is the number of the meal you want. The second argument is how many.
When you want to see the final balance along with the items you have ordered, just do the following

```
chinese.view
```

Finaly, if you are happy with everything you can confirm your order! the following command will help
with that

```
chinese.confrim("+44your_number_here")
```

By doing this you will get a confirmation, by text to let you know that your food will be with you
within an hour from point of order. 
