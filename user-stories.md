Objects in **Bold**<br>
Actions in *Italics*

------------

As a customer<br>
So that I can check if I want to order something<br>
I would like to *see a list* of **dishes** with **prices**<br>

As a customer<br>
So that I can order the meal I want<br>
I would like to be able to *select* some number of several *available* **dishes**<br>

As a customer<br>
So that I can verify that my order is correct<br>
I would like to *check that the **total*** I have been given matches the sum of the various **dishes** in my **order**<br>

As a customer<br>
So that I am reassured that my order will be delivered on time<br>
I would like to *receive a text* such as "Thank you! Your order was placed and will be delivered before 18:52" after I have *ordered*<br>

------------

| Object | Property or Owner? |
| ----------- | ----------- |
| Dish | Owner (or Property of a Menu?) |
| Price | Property |
| Order | Owner |

| Action | Belongs to? |
| ----------- | ----------- |
| list_dishes | Menu |
| select | Menu or Order |
| check_total | Order |
| send_text | TwilioManager |

| Action | Reads or Modifies |
| ----------- | ----------- |
| list_dishes | list of all dishes |
| select | list of all dishes, order array of dishes |
| check_total | order array of dishes |
| send_text | time? Twilio API |
