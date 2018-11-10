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

 How to run
 ----------

 To start the takeaway terminal app, type
```
 ruby ./lib/start_takeaway.rb
```
 into the console.

Enabling SMS response to order
------------------------------
 If you want to enable text messaging order confirmation, you will need to create a file ./info/info.rb which contains the following code:
```
 module Phone_info
   def get_account_sid
     return #YOUR_ACCOUNT_SID_HERE
   end
   def get_auth_token
     return #YOUR_AUTH_TOKEN_HERE
   end
   def get_from_number
     return #YOUR_TWILIO_NUMBER_HERE
   end
   def get_my_number
     return #YOUR_VERIFIED_TWILIO_CALLER_ID_HERE
   end
 end
```
replacing the comments with your details.

A note on the code
-------------------
* The code has been written for the most part using a TDD approach, using rspec to store and implement the tests
* Rubocop has been implemented
* An OOP approach has been used
