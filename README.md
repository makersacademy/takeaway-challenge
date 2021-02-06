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

### US 4
As a customer  
So that I am _reassured_ that my order will be _delivered_ on time  
I would like to receive a **text** such as "Thank you! Your order was placed and will be delivered before 18:52" after I have _ordered_  

| Objects  | Messages             | State         |
|----------|----------------------|---------------|
|cart/order|`place_order`         |CONTENTS, TOTAL|
|SMS func  |`send_sms`            |               |
|SMS       |                      |MESSAGE        |

## What went well? 
* Pleasantly surprised I got the sms service to work
* Used a trello board to plan the workflow (example [here](https://drive.google.com/file/d/1DO9PTdReV18bdncn1u2oqnob6OrQXFC3/view?usp=sharing))
* Used a class diagram that, although the final project deviated away from it, still helped in designing classes (example [here](https://docs.google.com/drawings/d/1-7jKE8m_3tYrczEPTwYWyE1ZpNChQ7CRCxNBaRFQ3n0/edit?usp=sharing))
* Feel I am getting better at extracting key information from user stories
* Feel I am getting better at designing with SRP in mind

## What didn't go so well?
* Feel I need more work on doubles and mocks in the unit tests
* The `Menu` class didn't serve a single responsibility. It acted as both a hub to access the other classes and a storing place for the menu. Perhaps a separate `Interface` and `MealList` class would have worked better