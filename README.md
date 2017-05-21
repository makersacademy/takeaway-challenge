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

- A customer would like to see a list of dishes with prices

```sh
2.4.1 :001 > require './lib/takeaway'
=> true

2.4.1 :002 > takeaway = Takeaway.new

2.4.1 :003 > takeaway.read_menu
 => {"Fish and chips"=>7, "Burger"=>8, "Kebab"=>10, "Pizza"=>12}
```

- The customer would like to be able to select some available dishes

```sh
2.4.1 :004 > takeaway.select_dish('burger', 2)
 => 2

2.4.1 :005 > takeaway.select_dish('pizza', 1)
 => 1
```

- The customer would like to check the sum of total and see the order

```sh
2.4.1 :006 > takeaway.show_order
1. 2x Burger, £8
2. 1x Pizza, £12
Total: £28
 => nil
```

- To ensure placing order is done correctly, the customer would receive a text similar to "Thank you! Your order will be delivered before 19:15"

```sh
2.4.1 :007 > takeaway.place_order(28)
SM050dc5c783954e2796a5fc58626cdd9a
 => nil
```
