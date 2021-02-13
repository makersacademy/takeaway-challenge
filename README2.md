# Takeaway challenge
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

## User Stories
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

## Planning

Objects | Messages

customer --> what to order
list of dishes with prices | see

customer --> order dishes
available dishes | select some number

customer --> verify order
total | check
dishes price | sum

customer --> order delivery time
text | receive

#### Hints
list of dishes with prices
text sending functionality - Twilio API
twilio-ruby gem to access the API

### Steps
- [x] Create a Dishes class responsable for storing menu and pushing items to the order
- [x] Initialize with an already-made dish list
- [ ] Order methods: 'browse', 'start_ordering', 'add_to_order', 'finish_order'
- [x] Create an Order class responsable for storing the items and caculating the bill
- [ ] Order methods:
