
Test files
----------

This file is to help the running of the program in IRB

for use in IRB to populate states

Populate a resturant with a instance of restuarant class

I'm calling the instance of the resturant pizza_hut in these tests

```
pizza_hut = Restaurant.new({ menu: Menu , options: { dishes: { rice: 10.99, pizza: 5.99 } } messenger: Messenger})
```

view dishes on menu

```
pizza_hut.current_menu.view_dishes
```


set up an order
```
order = Order.new( { items: { rice: 1, pizza: 1 }, total: 16.98, contact_number: '+4407572437603'}  )
 ```