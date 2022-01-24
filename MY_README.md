# Takeaway App

To run this app you will first need to setup an account with [Twillio](www.twilio.com). After you have setup a number to text to and from you will need to put the following information into a `.env` file in the route of this project:

```
ACCOUNT_SID=account_sid
AUTH_TOKEN=auth_token
MESSAGING_SERVICE_SID=messaging_service_sid
RECEIVER_NUMBER=receiver_number
```

## Where I got stuck

I had issues mocking the twilio_client I made. I wanted to check that send_message was calling the classes method once with the time string.

## Were I was going to go

I was plaining to setup a private method `one_hour_from_now` that was going to call the DateTime class and adjust the .hour by + 1, then return an appropriately formatted string. This would then feed into the argument of send_text.

## All the edge cases I didn't get time to check

I would have split the first test in the TwilioClass into several smaller ones to make it easier to read and test.

In the TwilioClient I would have tested for 400 responses and no connection responses.

I would have looked up the custom errors to rescue and return an empty string in those cases.

A private method in the TakeAway class check the return of the send_text, if an empty string, puts a message that 'a text could not be sent'.
