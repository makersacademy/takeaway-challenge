# Project Approach

## User story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
Object | Message
-|-
Menu | View

IRB test input:
```
menu = Menu.new({ burrito: '£6.80' })
menu.view
```

output:
```
2.5.0 :002 > menu = Menu.new({ burrito: '£6.80' })
 => #<Menu:0x00007ff48d0b2e10 @dishes={:burrito=>"£6.80"}>
2.5.0 :003 > menu.view
 => {:burrito=>"£6.80"}
 ```
---
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Object | Message
-|-
Order | add
Dishes | select

IRB test input:
```
menu = Menu.new({ burrito: '£6.80' })
menu.view
order = Order.new
order.add(burrito)
```

Current outstanding issues: the customer can order anything, even if it does not appear on the menu. 

---
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
