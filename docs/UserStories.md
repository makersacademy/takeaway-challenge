User Story 1

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

Diagram:
```puml
Customer->Restaurant: Menu
Restaurant-->Customer: Menu
```

User Story 2

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

Diagram:
```puml
Customer->Restaurant: Order(Dishes)
Restaurant-->Customer: Ordered Dishes
```

User Story 3

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

Diagram:
```puml
Customer->Restaurant: Order(Dishes)
Restaurant-->Customer: Ordered Dishes + Order Total
