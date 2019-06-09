Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

# Takeaway 

Pierogi Bar is a takeaway empire that sells world-famous pierogi. It's USP is the SMS order confirmation functionality (for UK numbers only but watch this space).  

_Takeaway Challenge is a Makers Academy practical_

## My approach:

- I started with reading through the user stories and planning my domain model, then drawing it out in UML format
- my initial idea was to create 3 classes: Pierogi (i.e. the restaurant), Menu and Order 
- as my tests started making more sense it became obvious that having a Menu class was an unnecessary complication and not required in the user stories so I removed it and hard coded a menu into the Pierogi class
- I coded for each user story by writing a multi-step test in my feature test first, then writing its unit test equivalent, then passing both in the simplest way possible

### User stories:

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

### Still to do:

- add tests for Twilio
- remove dependencies - currently using class instances in other classes which is not good practice and not a sustainable solution
- missing option to add quantities of the same item
- streamline adding to order so that items don't have to be added one at a time
- ideally I would add back the Menu class so that Pierogi's menu can be updated daily when the restaurant opens
- handling multiple orders
- refactor use of doubles in unit tests