Takeaway Challenge
==================

This is the week two weekend challenge at Makers.

The goal was to complete these user stories:

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

## Instructions

### Setup

Clone this repo then head over to Twilio to make a free acount. Once you've did that and have your `SID` and `Authentication Token`, make a `.env` file in the root.

You will need to include the following enviroment variables inside `.env`:

- `SID`
- `AUTH_TOKEN`
- `TWILIO_NUMBER`
- `REAL_NUMBER`

Run `bundler` to install all requried gems.

### Testing

Run `rspec` from any directory.

Note: The code has been written using TDD with the Red Green Refactor approach. 

