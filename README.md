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

 # Takeaway Challenge - Karim's version

 ### Steps taken to complete
 1. Create a fork of repo
 2. Clone to local git machine, install ruby 2.6.5 for simplecov, bundle install
 3. Create a physical list of potential objects and methods needed, inc. interactions
 4. Create lib dir with Menu and Order files, and respective spec files
 5. Feature/unit tested existence of a menu class. Created menu class to pass.
 6. Feature/unit test for checking menu has a hash, and responded to print_dishes. Fulfilled by creating instance var menu equal to a constant hash, and empty print_dishes meth
 7. Feature/unit test that print_dishes outputs dishes. Created a constant menu that menu classes default to (but can take other menus as init argument), as failed to use allow rspec syntax to force menu to return a smaller hash of dishes for menu. Used .map loop to produce output of dishes, with regex (gsub and sprintf) to format hash key and values for output.
 8. Feature/unit tested select dish method. Create method to pass tests. Also tested that the method takes two arguments, as need to pass these into order.
 9. Feature/unit tested the creation of an order class, and made sure it was initialised to empty array. Then tested + created a feature that allowed it to take dishes passed onto it from the Menu class and store in basket. 
 10. Feature/unit tested a verify method for the Order class, that would print a list of items in the basket including prices, and print the total price. Decided to split these responsibilities into two more methods; dish_print (for dishes and their prices) and total_print (for working out and printing the total). 
11. Created code for price summary.
12. Created test for text method in order.
13. Created text object to satisfy text method. New class that utilises twilio API
14. Created twilio trial account, and gained access to twilio trial number based in the USA
15. Added twilio gem to gemfile and installed using bundle
16. Modified Text class init to utilise twilio client
17. Created ignored local project environment variable (ignored by git) to store twilio credentials
18. Modified text tests now I understood what final class would look like. Modified tests using mocks to ensure that RSpec runs would not fire off live texts and consume twilio trial balance
19. With fixed tests, created a method that generated a text message based on texts and current time
20. Noticed that time test was testing state (i.e local computer time), not method. Installed gem Timecop and used its functionality to freeze time, ensuring I could use Text's time function (used within message generator) within my test without referencing logic used in actual method.
21. Fixed message tests by stubbing environmental variables
22. 2 lines of test missing on Menu (.view_order). Testing is mostly covered in the order_spec tests, but wrote equivalent tests anyway.
23. Noticed that program was only 97% test coverage. Earmarked final two tests for attention the next day.
Instructions
## TO IMPROVE
* Use guard conditions for selecting new dishes
* Increase test coverage to 100%
* Add comment signposting
* Add an app_admin class with save/load function for menus?
* Add a way of removing items from order

## USAGE
* The menu.rb file allows the user to view a menu. Menu is a hash with keys as food, values as price. .select_dishes creates a new Order class object, that stores selected dishes, and a total. 
* Once the order is locked in, a Text class is created that pings a message to twilio API. Twilio API phone number sends text to customer.

## BUILT WITH
* IDE used was VSCode
* Relied on Rubocop gem for formatting help, RSpec gem for automated unit tests, Timecop gem for manipulating time in unit tests, and env gem for creating local environment variables to the project
* Code base is entirely Ruby (tested with 3.0.0 & 2.6.5)