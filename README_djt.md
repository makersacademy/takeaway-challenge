Classes:

Dish
Menu
Order
`MenuFactory` class is used to `build` the `Menu` class. `build` takes one argument, an array of two key hashes.

Example:

```ruby

list = [{:name=>:sushi, :price=>5},
        {:name=>:burger, :price=>3},
        {:name=>:noodles, :price=>4}]

menu = MenuFactory.build(list)

```

`Menu` has the following public methods:
`dishes`
`select_dish`

`dishes` returns the list of orderable items on the menu. This is the key functionality of the menu.
`select_dish` is called by the Order class to add a menu item to the customer's current order.

The `Order` class looks after the customer's order and holds both records the customer's orders and keeps a tally of the running total.

Methods available to `Order`:

`choose_item`
`order_total`
`confirm_order`
`place_order`
`current_order`

`choose_item` adds a menu item to the customer's order. The name of the dish should be passed into `choose_item` as a symbol. `choose_item` can support a second argument for specifying the quantity of items, e.g.:

```ruby
order.choose_item(:sushi,2)
```

`order_total` will total up the value of all items that are in the `current_order`

`confirm_order` instantiates an `Invoice` and returns a hash of all items ordered with running subtotals. If the customer is happy, then they can `place_order`

`place_order` which takes an argument `phone_num` (in string form) will then text a confirmation and delivery promise to the customer.