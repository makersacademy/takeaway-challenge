# Takeaway Challenge

## Step 1 - Extracting Objects/ Methods/ States
### US 1
As a customer  
So that I can check if I want to _order_ something  
I would like to _see_ a **list** of **dishes** with PRICEs  

| Objects | Messages             | State |
|---------|----------------------|-------|
|menu     |`view`                |       |
|dish     |                      |PRICE  |

### US 2
As a customer
So that I can order the **meal** I want
I would like to be able to _select_ some number of several available **dishes**

| Objects  | Messages             | State         |
|----------|----------------------|---------------|
|menu      |`select`/`add`        |               |
|cart/order|`view`                |CONTENTS       |


### US 3
As a customer
So that I can verify that my **order** is correct
I would like to check that the TOTAL I have been given matches the SUM of the various dishes in my **order**

| Objects  | Messages             | State         |
|----------|----------------------|---------------|
|cart/order|`view`                |CONTENTS, TOTAL|

## US 4
As a customer
So that I am _reassured_ that my order will be _delivered_ on time
I would like to receive a **text** such as "Thank you! Your order was placed and will be delivered before 18:52" after I have _ordered_

| Objects  | Messages             | State         |
|----------|----------------------|---------------|
|cart/order|`place_order`         |CONTENTS, TOTAL|
|SMS func  |`send_sms`            |               |
|SMS       |                      |MESSAGE        |