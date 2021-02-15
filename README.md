# Takeaway challenge
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

## User Stories
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

## Planning
| Case | Objects | Messages |
| :---: | :---: | :---: |
| What to order | list dishes w/ prices | see |
| Order dishes | dishes | select some number |
| Verify order | total/ dish price | check |
| Order delivery time | text | receive |

#### Hints
list of dishes with prices
text sending functionality - Twilio API
twilio-ruby gem to access the API

### Tasks
- [x] Create a Takeaway class responsable for storing menu and pushing items to the order
- [x] Initialize with an already-made dish list
- [x] Order methods: 'browse', 'start_ordering', 'add_to_order', 'print_bill'
- [x] Create an Order class responsable for storing the items and calculating the bill
- [x] Order methods: 'calculate_bill'
- [x] Read about Twilio API and Sinatra
- [x] Run a simple Sinatra application following tutorial
- [x] Set-up ngrok server and run the Sintra App on it
- [x] Implement SMS alert using Twilo-ruby
- [ ] Create a method `checkout` that confirms the order and calls Twilio

## Learnings
**What is an API?**
Application programming interface - a messenger that takes requests and return a set of responses back.
Analogy => A waiter is a restaurant API. You'll order with the waiter, they will communicate with the restaurant and return your meal.

**What is a framework?**
Sets of libraries and classes for developing software applications.
It provides a foundation on which software developers can build programs for a specific platform, such as built-in functionalities, reusable software environment, working template application and the ability to write additional code to provide a bespoke application.

**What is the Sinatra framework?**
Very popular Ruby framework, it basically allows you to run your Ruby code on the web.
`require 'sinatra'`

## Issues encountered
* Struggling to write a test to check stdout after calling `basket` - this has brought my coverage down to 90%
* I wasn't following the correct resources to set-up Sinatra so I lost a lot of time trying to run the bundles
* I was able to run Sinatra server by following the set-up process [here](https://www.twilio.com/docs/usage/tutorials/how-to-set-up-your-ruby-and-sinatra-development-environment)
* I think I added a lot of unecessary set-up steps due to my lack of understanding of the use of each of these systems
* I still need to get my head around how to fit this into a standard Ruby code in order to create the `checkout` method

## How to Use

```
$ git clone git@github.com:sandyMax974/takeaway-challenge.git
$ bundle install
```

`class Takeaway`
* Run `new` to create a new takeaway restaurant
* Run `browse` to see the menu
* Run `start_order` to create a new order
* Run `add(item_number, quantity)` to add items to your basket
* Run `basket` to see a breakdown of the items ordered and the total cost
