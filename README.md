[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

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

Approach
-------

A program in Ruby designed to allow users to select multiple dishes from a menu, confirm their selection, place their order and receive a confirmation text message.

Installation
------

1. `git clone` this repository onto your local machine.

2. Run `bundle install` to install dependencies.

3. Run 'rspec' to run all unit and feature tests.

4. For Twilio API text functionality, [register for a free key](https://www.twilio.com/?mkwid=sycBqEwgT&pdv=c&pcrid=178304118126&pmt=e&pkw=twilio%20api&campaign=G_S_Brand_Alpha_EMEA&utm_source=google&utm_medium=cpc&utm_term=twilio+api&utm_campaign=G_S_Brand_Alpha_EMEA&utm_content=Brand&gclid=CjsKDwjw6qnJBRDpoonDwLSeZhIkAIpTR8LMzQEqjhWYopI7JLmoWagrkiZjoQmmv9lMX6EDyghwGgIR8PD_BwE) and then create a file called `info.rb` in the lib directory with the following infomation:

```
class Information

  FROM = '[Twilio account number]'
  TO = '[Your phone number]'
  SID = '[Twilio provided SID]'
  TOKEN = '[Twilio provided token]'
end

```

5.  To run the program, type the command:

```
ruby lib/takeaway.rb
```


Program Example
-------

```
Welcome to Jukes' Late Night Takeaway Emporium!
------------------
We have a lovely selection of food you will definitely regret ordering tomorrow.
----------
1. Extra Hot Vindaloo, £8
2. Mystery Meat Kebab, £7
3. Genetically Modified Fried Chicken, £9
----------
Please choose the number of the meal you would like:
2
Now please select the quantity you would like:
3
------------------
Thank you! Are you ready to check out?
Y/N
y
Thank you.
You have ordered:
Mystery Meat Kebab @£7 x3
The total is £21
Confirm order? (Y/N)

 *Text message sent via Twilio API*

 ```


User Stories
-----

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
