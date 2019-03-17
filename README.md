# Takeaway Challenge

[First Steps](#first-steps)  | [Running tests](#running-tests)

[User stories](#user-stories) | [Approach](#Approach) | [Development Points](#development-points)

I independently completed this Takeaway Challenge in mid-March 2019 as a "Weekend Challenge".

This program models how an online ordering system may offer functionality to customers.  A customer needs to be able to peruse a menu, make choices for themselves, have the total cost of their order calculated for them and, finally, receive a text to reassure them that their order is en route.

[Click here](https://github.com/makersacademy/airport_challenge) to access the original README specification.  

### First Steps

I forked the repo and cloned to my local device:      
`git clone https://github.com/amyj0rdan/airport_challenge`     
`gem install bundle`     
`bundle`     

### Running tests

`rspec`
`rubocop`

## User stories

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
## Approach

- Using pen and paper, drew diagrams representing the different classes and the interactions between them  
- Kept the customer in mind and brought my own experience of using similar services
- Adopted a predominantly TDD approach, but still finding this quite tricky.  

## Development Points

- Is test coverage 100% because my design is too simplistic?
- Allocate time more appropriately so sufficient time available to complete final part (implementation of message service)   
- Have worked to specification but could this have been an opportunity to think more holistically?
