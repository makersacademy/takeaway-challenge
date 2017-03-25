## Class Design Approach

| **Objects** | **Initialize**    | **Messages**
|-------------|-------------------|--------------|
| Menu        | List              |              |
|             |                   |display       |
|             |                   |select       ||
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
2. Menu

### Messages:
1. Order => Create order: Add food items and quantity.
2. Order => Look up price, times by quantity and add to sum 
