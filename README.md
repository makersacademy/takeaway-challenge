# Instructions to run program:

```
clone the repo
bundle install
unhide lines 59/60 on menu.rb
$ ruby lib/menu.rb
```
This will subsequently open up, and show you the menu in your terminal.

It will ask you if you would like to make an order (Y/N)

If you respond N, it will tell you that you made an error
If you respond Y, it will let you make an order, and show you the format you need to use to make an order.

input an order such as:
> 5 Americana, total: 50

It will subsequently ask you to confirm your order (Y/N)

if you select N, it will cancel your order
if you select Y, a text message will be sent to you.

Note: Text functionality has been disabled - I have hidden the necessary keys, as well as numbers in the uploaded git version.

# Approach to User Stories:
## User Story 1

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices

The customer is requesting a menu - my approach here was to create a menu class that holds the prices / list of items on sale.

I added a basic interaction front to this.

Had a few issues with testing the interaction with the menu

## User Story 2

> As a customer
> So that I can order the meal I want
> I would like to be able to select some
> number of several available dishes

The customer is asking to make an order. This indicates the class Order is needed, and needs to be a fresh order each time (new class instance). To do this, I dependency injected the class Order into Menu - whenever a customer asks to order something, a new instance of the Order class is created.

To complete the process - I just ask the customer to input their order in the Order class.

## User Story 3

> As a customer
> So that I can verify that my order is correct
> I would like to check that the total I have been given
> matches the sum of the various dishes in my order

For this user-story, I ran the string through a method that formatted the text to a split up array. From here, I pushed the formatted array through a method that calculates the actual cost, then did a check on what the customer thought their food was going to cost. Then, a simple error is thrown if there is anything different between the two.

## User Story 4

> As a customer
> So that I am reassured that my order will be
> delivered on time
> I would like to receive a text such as "Thank you!
> Your order was placed and will be delivered before 18:52"
> after I have ordered

This was a relatively easy implementation - my approach was to set up an account with Twilio, add the gem files, change the api key and auth token. Get a number that sends sms and input my number as a test.

The biggest challenge was figuring out if i should rspec this class - i ultimately decided against it as i was unable to test it in any meaningful way without sending messages to myself constantly!

Once i got everything working, I removed the sensitive information from the delivery class - this can be readded in future if there is the need.
