User Story 1

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

Diagram:
```puml
Customer->Restaurant: Menu
Restaurant->Customer: Menu
```

User Story 2

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

Diagram:
```puml
Customer->Restaurant: Order(dishes)
Restaurant->Customer: Ordered Dishes
```
