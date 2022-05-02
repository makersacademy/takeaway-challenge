# Takeaway Challenge

- This program is designed to order dishes from takeaway shop.
- This program can show menu and suggest if dish is available.
- This program creates basket for the user, where you they can put or delete selected dishes.
- This program can check the total of order.
- This program can send sms when order confirmed with suggested delivered time.
- This program uses Twilio.

---

## How to install the program

```
- Fork this repository

- Use "git clone" + your fork URL
```

---

## How to run the program

```shell

irb -r "./lib/order.rb"
```

---

## How to run the test

```shell
rspec

irb
```


## User story
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