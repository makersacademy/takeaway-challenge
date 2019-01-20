Takeaway Challenge
==================
 ```
                         (c)___c____(c)
                            \ ........../
                             |.........|
                              |..M.A..|
                              |.......|
                              |=======|
                              |=======|
                             __o)""""::?
                            C__    c)::;
                               >--   ::     
                               (____/      
                               } /""|      
                    __/       (|V ^ )\     
                    o | _____/ |#/ / |     
           @        o_|}|_____/|/ /  |     
                          _____/ /   |     
              ======ooo}{|______)#   |     
          ~~~~ ;    ;          ###---|8    
        ____;_____;____        ###====     
       (///0///@///@///)       ###@@@@|
       |~~~~~~~~~~~~~~~|       ###@@@@|
        \             /        ###@@@@|               
         \___________/         ###xxxxx      
           H H   H  H          ###|| |    
           H H   H  H           | || |     
           H H   H  H           C |C |    
           H H   H  H            || ||    
           H(o) (o) H            || ::   
          (o)      (o)        Ccc__)__)  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ```

Setup
-------

* Fork or clone this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems

Usage
-------

To use this, after you've installed the necessary gems, open IRB...

```
2.5.0 :001 > require './lib/takeaway'
 => true
2.5.0 :002 > takeaway = Takeaway.new
2.5.0 :003 > takeaway.read_menu
 => {"Thing1"=>10, "Thing2"=>12, "Thing3"=>15, "Thing4"=>8}
 2.5.0 :004 > takeaway.order("Thing1")
 => "1x Thing1(s) added to basket"
 2.5.0 :005 > takeaway.basket_summary
 => "Thing1 x 1 = £10"
2.5.0 :006 > takeaway.total
 => 10
2.5.0 :007 > takeaway.checkout(10)
```
**Note**

The checkout method will attempt to send a text message using Twilio and throw an error as it won't find any details to authenticate. To do this successfully, please sign up to Twilio and use the `dotenv` gem to add your authentication details and add them to `text.rb`.

Running automated tests
-------
This project uses `RSpec` to run automated tests. 

To run the automated tests, open the project root directory in your terminal and run `rspec`

Domain Model Diagram
-----

[![Screen-Shot-2019-01-19-at-22-49-57.png](https://i.postimg.cc/8k75MVQN/Screen-Shot-2019-01-19-at-22-49-57.png)](https://postimg.cc/t7HpGw4M)

Approach
-----

I followed the YAGNI (you aren't gonna need it) principle here and tried to stick to the user stories as best as possible. 

### Single Responsibility & Delegation

In order to keep things as single responsibility as possible, I chose to go with the following classes:

- **Takeaway class**: Acts as the 'controller' and delegates responsibilities
- **Menu class**: Contains the menu as its state, displays it when `@menu.view` is called.
- **Order class**: Takes the order and pushes it into its state (an array). Contains an instance of `Menu` in order to get the cost of each of the items being ordered. It also prints the current state of the order i.e. basket.
- **Calculator module**: Created a module as it doesn't need any state and doesn't need to be instantiated. This module can potentially be used for calculations (discounts etc). 
- **Printer module**: Unsure about the need for this module. 

Delegating responsibilities has allowed me to ensure that all my methods are 3 lines or less, ensuring easy updating and debugging. 

### Semantic naming

I've made an effort to ensure code readability by using semantic names for methods (for eg: `@menu.display`, `@order.take(dish, quantity)`, `@order.display`, `@text.send(MESSAGE)`)

### Testing for behavior and not state

As best as possible, my tests check for behaviour of the system under test (i.e. the isolated class) by mocking/stubbing external dependencies and checking for correct behaviour, for eg: `ordering a dish should add it to the order summary (basket_summary)`.

**A few places where I didn't create features: **

- The `order` method assumes that the user types in foods that exist, doesn't make a typo etc.
I did this because a) It wasn't explicitly mentioned in the user stories, and b) there was some discussion around the separation of business logic and the presentation/view layer where validation is done in one of the workshops. Of course, adding this functionality isn't difficult and would be fairly quick. 

- Lack of a presentation layer
Initially, I played around with the idea of displaying the dishes in a more presentational manner, however I chose to stick closely with the user stories. 


User Stories
-----
Here are the user stories this program solves for:

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
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.


