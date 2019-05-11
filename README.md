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
- Nepalese 'silver needle' white, £6
- Earl Grey, £2.75
- Ssukcha (korean mugwort), £5.20
- Ssanghwa-cha (korean medicinal), £4


## How to use:

```
irb instructions
```

---

### User stories:


One

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
- Nepalese 'silver needle' white, £6
- Earl Grey, £2.75
- Ssuk-cha (korean mugwort), £5.2
- Ssanghwa-cha (korean medicinal), £4


```

---

Two

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
 => 4
2.5.0 :003 > order.list
 => [{"Silver Needle white"=>6}, {"Silver Needle white"=>6}, {"Silver Needle white"=>6}, {"Silver Needle white"=>6}]
```
