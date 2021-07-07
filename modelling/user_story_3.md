# User Story 2

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

```

Objects | Behaviours
-|-
customer |
order | check total quanitiy of items

```
$ irb ./lib/menu

> order = Order.new
> order.add_item("margherita", 5)
> order.add_item("vegetarian", 2)
> order.total
"Total items: 8"
```