# README

[![Build Status](https://travis-ci.org/charlottebrf/takeaway-challenge.svg?branch=master)](https://travis-ci.org/charlottebrf/takeaway-challenge)

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

Technologies
-----

## Install

* Bundle install Gemfile dependencies

```bash
 $ bundle
 $ gem install bundle

```

* Ruby v '2.2.2'

```bash
$ rvm install 2.2.2
$ rvm use 2.2.2

```
Test coverage
-----
```
Test coverage: 96%
Rubocop: 7 offences
```

Task
-----

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

My Approach
-----
- **Menu**: Menu is a dependency of Takewaway class and is responsible for all Menu behaviours. It holds the hash of the Menu itself, as well as manages queries related to the Menu. For example: #extracts_starters #extracts_main_course #extracts_dessert.
- **Display**: Display is a dependency of the Takeaway class. Display is responsible for all for STDOUT prints.
- **Takeaway**: Takeaway is depending on the Display & Menu classes. Takeaway class was extracted to delegate behaviour not connected to its class to Display & Menu. I wrote two blog posts about this process, which can be found [here](https://medium.com/@charlottebrf/makers-academy-day-13-4e011debdbb) and [here](https://medium.com/@charlottebrf/makers-academy-day-18-cbbcb741eac).
- **Test Provider**: Created a TextProvider class.


Future Improvements
-----
- **Takeaway**: Much of the functionality of how users could place an order for User story 2 was modelled on the Pre-course Student Directory: #interactive_menu, #print_menu, #process_menu, #place_orders, #print_orders. For future refactors it would be interesting to explore other approaches.
- **Test Provider**: The tests for the TextProvider are incomplete and need to be completed.
