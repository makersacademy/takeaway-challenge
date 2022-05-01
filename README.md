# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  F.I. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D   )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    ))))))
      :  //  :   \ \ ''..'--:'-..  :
      '  ''  '    \:.....:--'.-''  '
       ':..:'                ':..:'

 ```

Instructions
------

* Feel free to use google, your notes, books, etc. but work on your own
* Fork this repo
* Clone to your local machine
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Test the code using rspec in the cloned directory on the command line terminal
* Can also be tested using irb on the command line terminal and using the below to load all the files to implement all the methods
```
irb
require './lib/menu'
=> true
require './lib/view_menu'
=> true
require './lib/order'
=> true
```
<br>

## Task
------
* Write a Takeaway program with the below user stories:
<br>
<br>

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
## My Approach
* Carried over learning from [Oystercard](https://github.com/Farzan-I/Oystercardday5) project
* Drew up a diagram using pen and paper for the first three user stories to aid the nouns and verbs that would become class names and method names
* Managed to get a total of 7 tests across 3 spec files to have 100% coverage and passing
* Didn't manage to implement the Twilio aspect of the code as I didn't have enough time. If I had, I'd look into doing this to complete the user stories
* The above would be done using tutorials on YouTube and using Google to aid the creation of the final piece of code

## Complications
* Had issues with the total instance variable (@total) as it would not return the total of the basket instance variable (@basket)
* This was rectified using solely a hash in the dishes instance variable (@dishes) rather than having the hash stored in an array as well
* One complication that hasn't been rectified is when a customer would add dishes (i.e. "meatball sub") to the basket, they could view the basket but it wouldn't give the total price. However, when the total method was called, it would give the total price of the basket but if the customer was to add something else, it would not increment the price accordingly
* If I had time, I would've wrote a whole new total method to rectify this issue as I tried to focus on user experience rather than anything else

## Code Review

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (100%)
* The code is elegant: every class has a clear responsibility, methods are short etc.



Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.
