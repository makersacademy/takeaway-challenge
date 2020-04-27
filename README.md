Takeaway Challenge
==================

    \\\\\\\|///////
     \\\\\\|//////
      \\\\\|/////
       \\\\|////
       ./#####\.
      -|#######|-
      -|#######|-                         Jock'O'Byte Restaurant
       '\#####/`            .    
        '  |  `     .      /   London's Favourite Virtual Scottish Restaurant
           |-  .   |\_ _//              
          -|    |\_|   //___.            ** NOW DOING TAKEAWAY **
           |    | '  / __--'
           |- . |  /  <___.
           |  |` /  __--'
          -|  |/___<.
           | /
           |-
           |
          -|



Instructions
-------

```
    $ git clone git@github.com:cjm106/takeaway-challenge.git
    $ cd takeaway-challenge
    $ rspec   # to run tests for User Stories 1-3

```

User Stories
-------

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

To Do
-------
  * Finish off the PlaceOrder class to include required billing functionality.
  * Enable PlaceOrder functionality to be accessed via the interactive_menu.
  * Create ConfirmOrder class and enable the order to be confirmed via the interactive_menu and txt message.
  * Enable Twilio API integration.
  * Enable the twilio-ruby gem to access the API.
  * Enable Gemfile management.
  * Refactor and test.
