## Class Design Approach

| **Objects** | **Initialize**    | **Messages**
|-------------|-------------------|--------------|
| Menu        | Dishes            |              |
|             |                   |read_menu     |
|Takeaway     |Menu               |              |
|             |Order              |              |
|             |                   |read_menu     |
|             |                   |order         |
|             |                   |basket_summary|
|             |                   |total         |
|Order        |Basket             |              |
|             |Total              |              |
|             |Menu               |              |
|             |                   |add_items     |
|             |                   |basket        |
|             |                   |total        ||



## Domains Models

## User Story 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

### Nouns:
As a **customer**
So that I can check if I want to order something
I would like to see a **list** of dishes with prices
### Verbs:
As a customer
So that I can check if I want to **order** something
I would like to **see** a list of dishes with prices
### Objects:
1. User (customer)
2. Menu
### Messages:
1. Menu => initialised with a list of dishes with prices
2. Menu => method to display the list

## User Story 2
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
### Nouns:
As a **customer**
So that I can order the meal I want
I would like to be able to select some **number of several available dishes**
### Verbs:
As a customer
So that I can **order** the meal I want
I would like to be able to **select** some number of several available dishes

### Objects:
1. User (customer)
2. Takeaway
3. Menu
4. Order

### Messages:
1. Takeaway => Add food items and quantity.
2. Takeaway => Return feedback message.
3. Takeaway => Return basket summary.
4. Takeaway => Return total cost.

5. Order => Check if items exist on menu, else return error message.
6. Order => If item exist, add to basket, with quantity, unit cost and calculated total cost.
7. Order => Add all items to total cost.

## Domains Models

## User Story 3
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

### Nouns:
As a **customer**
So that I can verify that my **order** is correct
I would like to check that the **total** I have been given matches the sum of the various dishes in my **order**
### Verbs:
As a customer
So that I can **verify** that my order is correct
I would like to check that the total I have been given **matches the sum** of the various dishes in my order
### Objects:
1. User (customer)
2. Takeaway
3.
### Messages:
1. Takeaway => Use checkout function to take payment
2. Takeaway => Check payment matches the total, else raise error
