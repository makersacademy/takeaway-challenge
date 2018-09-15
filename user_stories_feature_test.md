As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

```
load './lib/takeaway.rb'
# => see a list with options to order
1
# => see a menu
```

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

```
load './lib/takeaway.rb'
# => see a list with options to order
2
# => see message saying 'type order number or leave blank to end order'
1
2
3
3
4

# each number confirmed with dish and price.
```

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

```
load './lib/takeaway.rb'
# => see a list with options to order
2
# => see message saying 'type order number or leave blank to end order'
1
2
3
3
2
4

# each number confirmed with dish and price.
# blank line ends order
# next line confirms full order and price which matches the total price of all dishes individually
```

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

```
load './lib/takeaway.rb'
# => see a list with options to order
2
# => see message saying 'type order number or leave blank to end order'
1
2
3
3
2
4

# each number confirmed with dish and price.
# blank line ends order
# next line confirms full order and price which matches the total price of all dishes individually
# line saying 'type yes to confirm order'
yes
# receive text confirming order
```