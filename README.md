* Week 2: Takeaway Challenge

** Installation Requirements

Users must run bundle in the command line to install the required gems for the
program to work.

** Guidance in using the program

First the takeaway user of this program must create dishes, giving each a name
and price. An example is provided below:

```ruby

pizza = Dish.new(name: pizza, price: 1)

chicken = Dish.new(name: chicken, price: 2)

```

Note that the labels `name:` and `price:` must be used and both attributes must
be provided. However, the order in which they are provided is not important.

A Dish List can then be created as follows:

```ruby

dish_list = DishList.new([pizza, chicken])

```

Note that dishes must be put into square brackets, `[]`.
