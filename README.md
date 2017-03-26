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

### Task

We were asked to write a program to .

I aimed to complete this challenge by using a test-driven approach, using manual feature tests within IRB and automated unit tests using RSpec.

We were given user stories, which I first broke down using domain modelling. My resulting models were then converted into failing feature tests, then translated into RSpec as failing unit tests. Following that, I wrote my code.

Care has been taken to ensure encapsulation was done as much as possible, so that the user (Customer) can only interact with an instance of the Interface class.

I used the Twillo API to enable my program to send confirmation texts to mobile phones.

### User stories

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

### Installation

Clone repository:
```
$ git clone git@github.com:nazwhale/takeaway-challenge.git
$ cd takeaway-challenge
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

### Example of use

To make an order, then take it off again in IRB:

```
$ irb
2.2.3 :001 > require './lib/interface'
 => true
```

### Domain model

Functional representation:

| Objects                  | Messages                 |
| ------------------------ | ------------------------ |
| Menu                    | display         |
| Interface                  | welcome           |
| Interface                    | total_correct?         |
| Order                    | take_order          |
| Calculator                  | total_order            |
| Text                    | send_text        |

Diagram of communication between objects and messages:
