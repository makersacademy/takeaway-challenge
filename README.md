[![Build Status](https://travis-ci.org/jbropho/takeaway_chall
enge.svg?branch=master)](https://travis-ci.org/jbropho/takeaway_challenge)
# Takeaway Challenge
## Makers Academy weekend challenge to create a takeaway app with text notifications.
[Challenge Specification](https://github.com/makersacademy/takeaway-challenge)

## Usage

1. Sign-up for a [Twilio Account](https://www.twilio.com/) and follow
the steps to set up a phone number to send/receive texts.

2. Project set-up
      ```
      git clone https://github.com/jbropho/takeaway-challenge
      cd takeaway-challenge
      bundle install
      ```

3. Set temporary environment variables
      ```
      export AC_SID=your_account_sid_here
      export TWIL_TOKEN=your_auth_token_here
      export MY_NUMBER=your_real_phone_number
      export TWILIO_NUMBER=your_twilio_phone_number
      ```


## Extra, order via text
5. Sign up for an account with [Heroku](https://heroku.com), install and login to the CLI

6. Inside project root directory

    ```
    heroku create
    heroku config:set AC_SID=your_account_sid_here
    heroku config:set TWIL_TOKEN=your_auth_token_here
    heroku config:set MY_NUMBER=your_real_phone_number
    heroku config:set TWILIO_NUMBER=your_twilio_phone_number
    heroku push master
    '''

7. Go to the manage numbers sections of your Twilio account dashboard,
click on your twilio number to edit. In the messaging section add the root url of your heroku app to the 'A message comes in' webhook and set the HTTP method to POST.

8. Send your order via text to your Twilio number

   ```
   {:dal_makhani => 3, :biryani => 2, :bhaji => 3, :total => 8}
   ```
