# Takeaway Challenge

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

I've chosen to theme my takeaway on tea.

The menu lists the choices:

- Gunpowder green, £1.80
- Silver Needle white, £6
- Earl Grey, £2.75
- Ssukcha (mugwort), £5.20
- Ssanghwa-cha (medicinal), £4


## How to use:

```
* irb instructions
```

---

### User stories:


ONE

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

objects | behaviours
-|-
customer |
order |
menu | view dishes and prices  

![user_story_01](./modelling/user_story_01.png)

```
$ irb -r ./lib/menu

2.5.0 :002 > menu = Menu.new
2.5.0 :003 > menu.view

- Gunpowder green, £1.8
- Silver needle white, £6
- Earl Grey, £2.75
- Ssuk-cha (mugwort), £5.2
- Ssanghwa-cha (medicinal), £4


```

---

TWO

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

objects | behaviours
-|-
customer |
order | choose from menu, choose amount
menu |

![user_story_02](./modelling/user_story_02.png)  

```
$ irb -r ./lib/order

2.5.0 :001 > order = Order.new
2.5.0 :002 > order.choose_from_menu
Would you like to order something?
Enter the tea or finish

- Gunpowder green, £1.8
- Silver Needle white, £6
- Earl Grey, £2.75
- Ssuk-cha (mugwort), £5.2
- Ssanghwa-cha (medicinal), £4

white
the selected tea is: Silver Needle white, costing £6
how many would you like?
4

2.5.0 :003 > order.list
 => [{"Silver Needle white"=>6}, {"Silver Needle white"=>6}, {"Silver Needle white"=>6}, {"Silver Needle white"=>6}]
```

---

THREE

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

objects | behaviours
-|-
customer |
order | show order and calculate total, ask if ok
menu |

![user_story_03](./modelling/user_story_03.png)

```
$ irb -r ./lib/order

2.5.0 :001 > order = Order.new
2.5.0 :002 > order.checkout
Is this correct?
Enter yes to place order or no to cancel.


- Total:           £0

no
Traceback (most recent call last):
        4: from /Users/student/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):2
        2: from /Users/student/Projects/takeaway-challenge/lib/order.rb:49:in `checkout'
        1: from /Users/student/Projects/takeaway-challenge/lib/order.rb:78:in `check_order'
RuntimeError (order not correct, cancelling)
```
