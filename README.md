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

Synopsis

```

This project is to replicate a takeaway software. This software allows the customer see the menu, place order , check the total . The customer receives a text message on the delivery time on placing a order.

```
Code Example

```
There are 4 classes
1. Takeaway - Responsible  view menu, view ordered items, confirm total and send text message
2. Order - Responsible for calculating total price for order
3. Menu - Hash of menu items
4. Text - Connects to twilio API to send a SMS

```
Installation

```
1. Clone the project
2. run 'gem install bundle'
3. run 'bundle'
4. In the root of the project folder create .env file and populate it with
ACCOUNT_SID=[Twilio ACCOUNT_SID]
AUTH_TOKEN=[Twilio AUTH_TOKEN]
FROM=[TWILIO Phone number]
TO=[CUSTOMER Phone number]

```
References

```
 https://github.com/bkeepers/dotenv - for keeping sensitive information safe
 https://github.com/Nandhini31/takeaway-challenge/blob/master/docs/review.md - refer stub for send-sms  

```
