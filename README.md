Takeaway Challenge
==================

Here is my work so far on this and the below user stories go someway to explaining what this code is supposed to do (these tests are also in the spec/feature_tests.rb file).

Gems used
---------
Twilio API


Additional Notes
----------------
Due to running out of time on this challenge I had a list of refactoring that I wanted to do - I wanted to split my main 'TakeAway' class so that it did not violate the single responsibility principle, use dependency injection and general tidying up re.DRY.
I also need add work on the display/summary methods so that the correct information (ie price x qty) is extracted from my hashes/array.
Also, although my tests all passed, I only had 85% approx coverage so far. I could have also made further use of testing with stubs & doubles.

User Stories
------------

<!-- User story 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices -->
```
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu
```

<!-- # User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes -->
```
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu
takeaway.select("chips", 2)
takeaway.select("kebab", 3)
```

<!-- # User story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order -->
```
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu
takeaway.select("chips", 2)
takeaway.select("kebab", 3)
takeaway.summary
```

<!-- # User story 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered -->
```
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.select("kebab", 3)
takeaway.summary
takeaway.complete_order
takeaway.text
```
