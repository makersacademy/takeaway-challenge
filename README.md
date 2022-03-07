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

Installation
-----

* Fork this repo and clone to your local drive
* Run the command 'bundle' in the project directory to ensure you have all the gems

Instructions
---------
Write a Takeaway program with the following user stories:

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

Tests
-----
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```

Approach to challenge
-----
I created a UML diagram to model out the code to see what it would look like prior to writing any code or tests - as shown below.

![Screenshot 2022-03-05 at 13 37 08](https://user-images.githubusercontent.com/74867241/156885777-41655a4a-b22a-466c-92c1-ad6ed447c52b.png)

Upon working through the challenge, I realised that perhaps another class 'Takeaway' would be appropriate. I therefore amended the diagram as shown below.

![Screenshot 2022-03-06 at 17 19 20](https://user-images.githubusercontent.com/74867241/156934224-48983305-3dbc-429c-bf3c-f2ddc382b3b6.png)

I followed a strict TDD approach and ensured that I used mocking and doubles across various classes. I had a vague thought that dependency injection would be required, however as I had only been briefly exposed to this concept during this weeks Oystercard challenge, I was not confident enough to apply it. 

To complete the challenge I would be required to:
* Complete the 4th user story where I would implement the Twilio API
* Include tests for edge cases 