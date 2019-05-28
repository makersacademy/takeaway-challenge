Takeaway Challenge
==================
```
                            _________
              r==           | Sushi |
           _  //            |  and  |   ))))
          |_)//(''''':      | Pizza |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

For original challenge instructions, see https://github.com/makersacademy/takeaway-challenge*


Requires a Twilio account. Get a Twilio account here: https://www.twilio.com/

Note: 100% test coverage if Twilio is enabled. Disabling Twilio, or having no environment variables setup, will skip some unit and feature tests and lead to a reduced test coverage.

Required environment variables: 

```
TWILIO_ENABLED=
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_PHONE_NUMBER=
MY_PHONE_NUMBER=
```

> TWILIO_ENABLED=

* 1 for enabled, 0 for disabled 

> TWILIO_ACCOUNT_SID=

* SID from Twilio dashboard

> TWILIO_AUTH_TOKEN=

* Auth token from Twilio dashboard

> TWILIO_PHONE_NUMBER=

* The send-from phone number associated with Twilio account

> MY_PHONE_NUMBER=

* The phone number to send the SMS notifications to (for Twilio trial accounts this must be set up and confirmed in Twilio account)


Usage:

With default menu:
```Ruby
require 'takeaway'
takeaway = Takeaway.new
takeaway.dishes # returns a list of dishes
takeaway.order("Pizza *1, Sushi *2", 33.50) # places order & sends confirmation message
```

With a custom menu:
```Ruby
fried_rice = Dish.new("Fried_rice", 6.50)
okonomiyaki = Dish.new("Okonomiyaki", 11.00)
asian_fusion_dishes = {
      "Fried_rice" => fried_rice,
      "Okonomiyaki" => okonomiyaki
} # create a hash of dishes
asian_fusion_takeaway = Takeaway.new(asian_fusion_dishes)
asian_fusion_takeaway.dishes # returns a list of dishes
asian_fusion_takeaway.order("Fried_rice *1, Okonomiyaki *2", 28.50) # places order & sends confirmation message
```
