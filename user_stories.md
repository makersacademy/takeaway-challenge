### User Stories

> As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

| Object | Message |
| :----: | :----: |
| Takeaway | show_menu |
| Menu | show_dish, show_price |

>As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

| Object | Message |
| :----: | :----: |
| Order | select_dish |

>As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

| Object | Message |
| :----: | :----: |
| Order | sum_price |

>As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

| Object | Message |
| :----: | :----: |
| Text | send_text |
