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



```
~~As a customer
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
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered~~
```

* Hints on functionality to implement:
  * ~~Ensure you have a list of dishes with prices~~
  * ~~The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".~~
  * ~~The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.~~
  * ~~Use the twilio-ruby gem to access the API~~
  * ~~Use the Gemfile to manage your gems~~
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* ~~ A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.~~

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.



User stories breakdown with relationships
======================

* customer > takeaway > menu > list of dishes
* customer > takeaway > menu > select dishes > order(customer_selection)
* customer > takeaway > order > verify total
* customer > takeaway > complete order (I added this one by inference it would be needed)
* customer > takeaway > delivery confirmation > twilio

Classes
=======
* Takeaway
* Menu
* Order
* Dish
* Twilio (dependency)


Properties and Actions
======================

* Takeaway has
  1. :x: an empty order
  2. :x: a default menu
* Takeaway can
  1. :x: report order
  2. :x: select a dish to add to order
  3. :x: complete Order
  4. :x: delivery confirmation(order)

* Menu has
  1. :x: an array of Dish-es
* Menu can
  1. :x: list available dishes

* Order has
  1. :x: an empty array of Dish-es
  2. :x: order completion time
* Order can
  1. :x: report its dishes
  2. :x: verify total
  3. :x: define complete time
  4. :x: define the delivery time (actually provides 1 hour past completion time)

* Dish has
  1. :x: a name
  2. :x: a price
* Dish can
  1. :x: report its name
  2. :x: report its price

* Twilio REST Client messages create (API credentials in environmental variables)

After passing all tests, I wrote the following user behaviour feature test under feature_spec.rb: 'looks at the menu, selects two dishes, looks at the total, completes the order, sends a confirmation text'

There are still plenty of edge cases I didn't test for but I believe the fundamental relationships between objects work out and I was able to mock them up successfully in testing.
