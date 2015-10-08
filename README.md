# Takeaway Challenge

A simple Ruby application to simulate how a takeaway food ordering service might be automated.

The `Takeaway` class functions as a container for a menu, with available dishes listed manually in the `initialize` function. This is sub-optimal and in a working implementation I'd like to see these being read in from a file. The menu can be listed by calling the `see` method.

An order is placed using `order`, and the customer is required to calculate and submit the price themselves to avoid overcharging.

Other classes are `Dish`, which is the most basic unit, with a knowledge of its "number" (a reference, not a quantity), a discription, a price, and a quantity. Class `Meal` contains an array of `Dish`es and provides its cost when the method `total` is called.


# Example syntax

```
2.1.5 :001 > menu = Takeaway.new(Dish)
 => #<Takeaway:0x007fa911ad7c78
 @menu=
  [#<Dish:0x007fa911ad7bb0 @description="Duck a la banana", @number=44, @price=4.5, @quantity=0>,
   #<Dish:0x007fa911ad7ac0 @description="Deep fried Mars bar", @number=10, @price=0.1, @quantity=0>,
   #<Dish:0x007fa911ad7a20 @description="Birdseye potato waffles", @number=20, @price=1.99, @quantity=0>,
   #<Dish:0x007fa911ad7868 @description="Trio! Trio.", @number=69, @price=1.5, @quantity=0>]>
2.1.5 :002 > menu.see
 => "44 : Duck a la banana : £4.50, 10 : Deep fried Mars bar : £0.10, 20 : Birdseye potato waffles : £1.99, 69 : Trio! Trio. : £1.50"
2.1.5 :003 > menu.order([[44, 2], [20, 1]], 10.99)
 => true
```

## Functional representation
### Nouns
* Dishes
* Meal
* Text

### Verbs
* Check _(...whether the order total entered is correct.)_
* See _(...a list of dishes with prices.)_
* Order _(...a meal, which is another name for a list of dishes.)_
* Receive _(...a text message, or, rather send the text message will probably be more appropriate.)

### Table
Objects  | Messages
------------- | -------------
`dish` | `see`
`meal` | `check`, `order`
`sms` | `send`
