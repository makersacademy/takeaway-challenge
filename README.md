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

## Task

- Fork this repo
- Run the command 'bundle' in the project directory to ensure you have all the gems
- Write a Takeaway program with the following user stories:

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

- Advanced! (have a go if you're feeling adventurous):
  - Implement the ability to place orders via text message.

## Objectives

To understand the single responsibilty principle and how gems can be used to add functionality to a program.

## Technology

- Ruby
- Twilio
- Rspec

How to use

# Setup

#### App

1. Install Ruby (version 2.6.5 or above)
2. Clone this depository
3. Run the command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle`

#### Environment Variables

1. Open ~/.zshrc or ~/.profile depend on your Mac OS version

2. Append in the file:
   export TWILIO*ACCOUNT_SID="ACCOUNT SID"
   export TWILIO_AUTH_TOKEN="AUTH TOKEN"
   export TWILIO_NUMBER="PHONE NUMBER"
   export USER_MOBILE="Verified Caller"
   \_Replace contents within the quotes with your Twilio account details, Twilio mobile number and your own mobile number*
   _Make sure USER_MOBILE is shortlisted as verified caller in Twilio_

3. run source ~/.zshrc or source ~/.profile

## To Run

```
$ git clone https://github.com/katebeavis/takeaway-challenge.git
$ cd takeway-challenge
$ bundle install
$ irb
    > Dir['./lib/*.rb'].each {|file| require file }
```

## To Run Tests

```
$ rspec
```
