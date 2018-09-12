As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```
require './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.show_menu() #menu{dishes => price}

```

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

```
require './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.show_menu() #menu{dishes => price}
takeaway.select_dishes #ordered_dishes
```

```
takeaway.order(cust_order) #customer_order
#expect(cust_order).to include(takeaway.menu[:dish])
expect { takeaway.order(cust_order)}.to raise_error if cust_order.not_include(takeaway.menu[:dish])
```
