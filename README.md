![](https://placehold.it/950x200/374c53/FFFFFF/?text=Takeaway)

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

## user stories:

\*\*Nouns

\*Actions

```
As a customer
So that I can check if I want to **ORDER** something
I would like to see a *LIST OF DISHES WIHT PRICES*

As a customer
So that I can order the meal I want
I would like to be able to *SELECT some NUMBER* of several *AVAILABLE DISHES*

As a customer
So that I can verify that my order is correct
I would like to *CHECK that the TOTAL* I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to *RECEIVE TEXT* such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## Investigating the user stories.

| Nouns | Property or Owner of property? |
| ----- | ------------------------------ |
| order | owner                          |

| Actions                   | Owned by? |
| ------------------------- | --------- |
| list of dishes with price | order     |
| select number             | order     |
| available dishes          | order     |
| check total               | order     |
| receive text              | order     |

| Actions                   | Property it reads or changes |
| ------------------------- | ---------------------------- |
| list of dishes with price | order                        |
| select number             | order                        |
| available dishes          | status(owned by order )      |
| check total               | order                        |
| receive text              | order                        |

## Class diagrams for these user stories:

| Class (Owners)  | Properties (instance variables) | Actions (methods) |
| --------------- | ------------------------------- | ----------------- |
| TakeAway(Order) | menu, basket, sum               | summary, checkout |

## Hints on functionality to implement:

:ballot_box_with_check: Ensure you have a list of dishes with prices
:ballot_box_with_check: Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
:ballot_box_with_check: The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
:ballot_box_with_check: Use the twilio-ruby gem to access the API
:ballot_box_with_check: Use the Gemfile to manage your gems
:ballot_box_with_check: Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
:ballot_box_with_check: However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
:ballot_box_with_check: Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

- Advanced! (have a go if you're feeling adventurous):

  - Implement the ability to place orders via text message.

:ballot_box_with_check: A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

:ballot_box_with_check: Finally submit a pull request before Monday at 9am with your solution or partial solution. However much or little amount of code you wrote please please please submit a pull request before Monday at 9am
