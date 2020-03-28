# User Story 2

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

```

Objects | Behaviours
-|-
customer |
order | select number of dishes 

```
$ irb ./lib/menu

> order = Order.new
> order.show_order
[]
> order.add_item("margherita", 5)
> order.show_order
[["margherita", 5]]
> order.add_item("vegetarian", 2)
> order.show_order
[["margherita", 5], ["vegetarian", 2]]
> order.add_item("diavola")
> order.show_order
[["margherita", 5], ["vegetarian", 2], ["diavola", 1]]
```