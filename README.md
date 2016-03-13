**DELIVEROOBY**
==================
```
                            _________
              r==           |       |
           _  //            |  Gems |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Initialize a new takeaway outlet

  `takeaway = Takeaway.new`

Check the menu (all menus/orders are in hash format)

  `takeaway.menu` => {rice: 5, pea: 10}

Select items + quantities from the menu and receive a cost

  `takeaway.select_items({rice: 3, pea: 5})` => 65

Place order with a hash and payment - will raise error if payment is incorrect

  `takeaway.place_order({rice: 3, pea: 5}, 65)`

A text message will be sent confirming this order

```


```

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
