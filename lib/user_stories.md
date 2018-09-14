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
menu_obj = Menu.new
takeaway.show_menu() #menu{dishes => price}
<!-- expect(menu_obj).to receive(:show_menu)
menu_obj.show_menu -->
expect(menu_obj.show_menu).to eq(menu_obj.menu)
takeaway.ready_to_order #ordered_dishes
expect { menu_obj.select_dishes }.to change { menu_obj.ordered_dishes }
menu_obj.ordered_dishes.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order


```
require './lib/takeaway.rb'
takeaway = Takeaway.new
menu_obj = Menu.new
takeaway.show_menu() #menu{dishes => price}
expect(menu_obj.show_menu).to eq(menu_obj.menu)
takeaway.ready_to_order #ordered_dishes
expect(menu_obj).to receive(:select_dishes)
menu_obj.select_dishes
expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)
takeaway.verify_order(customer_order)
total = customer_order.each { |item| item[:price] * item[:quantity]}).reduce(:+)


```
