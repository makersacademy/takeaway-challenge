Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | J.O.J |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Description
-------

* This intention of this project is to simulate a typical online takeaway
  service, with relevant functionality across two classes, including:

  (Menu)

    * show_menu - Reveals the menu for a customer's consideration.
    * pick(item) - Allowing a user to pick items they might like.

  (Order)

    * choose(item, quantity) - Allows a user to pass their choice of item and
                               desired quantity to store in their 'selections'.
    * sum_total - Calculates total cost of customer selections
    * complete order - Receives an argument as payment for the customer's
                       order, returning an error if the incorrect amount is received and delivering a confirmation text if payment
                       has been successful.             

Installation & Use
-----

* A list of required gems can be found in the included Gemfile

* In the program's root directory (takeaway-challenge), open IRB and run  'require order'.

* run: menu.show_menu - to reveal restaurant menu
       order.choose(item, quantity) - to add an item & its quantity to an order
       order.selections - to review selections so far.
       order.sum_total - to finalise selections
       order.complete_order(pay) - Pass in the relevant amount to pay for the
                                   order.
