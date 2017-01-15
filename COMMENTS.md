Detailing my steps:
------------------

#### Step 1: Developing a domain model
- Read through the user stories and developed my domain model

#### Step 2: Building the first feature
- Started with tackling the first user story of seeing a list of dishes
  - Wrote feature test in RSpec in userstories_spec.rb and then write a unit test asking for a menu class
  - Created a menu class and wrote a method inside of it called see_dishes

#### Step 3: Building the second feature
- Moved on to dealing with the second user story and developed a method called select_dishes

#### Step 4: Building the third feature
- Tackled the third user story for checking that the total is correct.
  - At this stage, created an order object with select dishes as an instance array
  - Check method then checks that the length of the array (i.e. the number of selected dishes) is as expected

#### Step 5: Refactoring to create a dish class
- Now that my first three user stories have been met in the most simple way possible, I've decided to extend my code so that the design is more in line with my original domain model.
  - Created a dish class so that they can be injected in to the menu list
  - Here my development is less test-driven but unit tests are added to validate the added code

#### Step 6: Refactoring tests
- Next decided to refactor tests so that they are more readable - in particularly changed all spec files to use named subjects

#### Step 7: Integrating Travis CI and Coveralls
- Refreshed my repositories on Travis CI and Coveralls and turned on testing for this repo on both.
- Added Travis and Coveralls status badges to README.md

#### Step 8: Building the final feature using Twilio
- Signed up to Twilio and installed Twilio Gem
  - Added gem to Gemfile so that dependency is tracked for other users of my code
- I've now been able to implement the Twilio API to send a text on order.
  - Note that this functionality was added in to the order class and select_dishes delegates confirming the order to the order class

#### Step 9: Added an exception to select_dishes
- Now that all the features/user stories have technically been satisfied, I've moved onto extending the code based on the additional hints and tips (see README.md)
- Added an exception to the select_dishes method based on the check method - so that if the number of selected dishes is not the same total quantity as the user expected (based on the method arguments), then an error is raised.
- Adding this feature meant that some refactoring of the tests was needed to take into account the new argument required in the select_dishes method

#### Step 10: Extending confirmation text to use time stamp
- I'm now moving on to further extending my code beyond that exactly specified in the user stories. It is a good learning opportunity for me to try new things out based on my ideas.
- Required the ruby time module into the order class and added a time-stamp of when the order was placed to the confirmation text

#### Step 11: Extending menu list to load from a CSV
- Again, it didn't seem very DRY for the menu instance variable to by a long array. If the menu was the length of a normal menu this would be very repetitive at the top of the menu class.
- Decided to implement so that the instance variable loads on initialisation of the menu class from a csv of dishes and their prices. A new dish object is created on instantiation of menu for each row in the csv.
