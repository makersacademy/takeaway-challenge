# User Story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```

Objects | Behaviours
-|-
customer |
menu | view dishes and prices  

```
$ irb ./lib/menu

> menu = Menu.new
> menu.show_menu
>> {:margherita=>7.99, :four_cheese=>8.5, :vegetarian=>9.99, :meat_feast=>12.99, :diavola=>12.99} 
```