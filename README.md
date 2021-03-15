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
  1. :x: an empty order :check:
  2. :x: a default menu :check:
* Takeaway can
  1. :x: report order :check:
  2. :x: select a dish to add to order :check:
  3. :x: complete Order :check:
  4. :x: delivery confirmation(order) :check:

* Menu has
  1. :x: an array of Dish-es :check:
* Menu can
  1. :x: list available dishes :check:

* Order has
  1. :x: an empty array of Dish-es :check:
  2. :x: order completion time :check:
* Order can
  1. :x: report its dishes :check:
  2. :x: verify total :check:
  3. :x: define complete time :check:
  4. :x: define the delivery time (actually provides 1 hour past completion time) :check:

* Dish has
  1. :x: a name :check:
  2. :x: a price :check:
* Dish can
  1. :x: report its name :check:
  2. :x: report its price :check:

* Twilio REST Client messages create (API credentials in environmental variables)

After passing all tests, I wrote the following user behaviour feature test under feature_spec.rb: 'looks at the menu, selects two dishes, looks at the total, completes the order, sends a confirmation text'

There are still plenty of edge cases I didn't test for but I believe the fundamental relationships between objects work out and I was able to mock them up successfully in testing.
