# Takeaway Challenge

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

```
## Steps Completed

-   [x] As a customer
        So that I can check if I want to order something
        I would like to see a list of dishes with prices

-   [x] As a customer
        So that I can order the meal I want
        I would like to be able to select some number of several available dishes

-   [x] As a customer
        So that I can verify that my order is correct
        I would like to check that the total I have been given matches the sum of the various dishes in my order

-   [x] As a customer
        So that I am reassured that my order will be delivered on time
        I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

All of the above working and text messages being sent tested via Twilio :)

IMPORTANT - Before running the tests you need to add a .env file in which you need to include the environment variables needed as follows else the sms test will fail:

ACCOUNT_SID= {put your twilio account id here}

AUTH_TOKEN= {put your twilio auth token here}

TWILIO_FROM= {put your twilio mobile number here(UK)}

TWILIO_TO= {put your mobile number here}
```
