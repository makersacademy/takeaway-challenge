Takeaway Challenge (JM Note)
============================

Class Diagram
-------------
* You can see my class diagram here : (https://wireframe.cc/xu2cm2)

Development
-----------
* 'twilio-ruby' gem was used to access the API
* 'dotenv' gem was introduced for environment variables

Test
------
* All RSpec tests passed - 95% coverage

```
Confirmation
  raises an error if the money does not match the total
  displays time in hour, minutes, am/pm, one hour from current time
  sends a text that food will be delivered within an hour

Menu
  has dishes you can choose
  shows prices of dishes

Order
  has an empty basket of dishes by default
  #add_to_basket
    is expected to respond to #add_to_basket
    can add dishes to basket
  #count_item
    can count items in your basket
  #total_in_basket
    can calculate total in your basket

```