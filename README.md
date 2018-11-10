# Instructions to run program:




# Approach to User Stories:
## User Story 1

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices

The customer is requesting a menu - my approach here was to create a menu class that holds the prices / list of items on sale.

I added a basic interaction front to this.

Had a few issues with testing the interaction with the menu

## User Story 2

> As a customer
> So that I can order the meal I want
> I would like to be able to select some
> number of several available dishes

The customer is asking to make an order. This indicates the class Order is needed, and needs to be a fresh order each time (new class instance). To do this, I dependency injected the class Order into Menu - whenever a customer asks to order something, a new instance of the Order class is created.

To complete the process - I just ask the customer to input their order in the Order class.

## User Story 3
