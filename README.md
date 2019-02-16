# Weekend Challenge 2: Takeaway

[Original challenge README](challenge-README.md)


## Domain Modelling

_In these messages,_ `{ object }` _is an object returned and as in Ruby,_ `(object)` _after a message name is an object received (i.e. argument)_
  
| Object         | Messages                     |   
| -------------  | ---------------------------- | ---
| **dish**           | `name` { `attr_reader :name` }<br>`price` { `attr_reader :price` } |
| **list_of_dishes** | `list_dishes` { `dishes` }         |
| **order**          | `add`(`dish`)<br>`remove`(`dish`)<br>`review_order` { `selected_dishes` }<br>`order_total` { _sum of prices of all dishes in_ `selected_dishes` }    | 
| **order_submission** | `submit_order`(`order`) |
| **order_confirmation** | `send_text`(`confirmation_message`)  |
  
## Feature Tests

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
