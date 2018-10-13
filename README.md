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


To do: 
read notes
finish oyster
watch SOLID vid

_________________________________________________________________________________________________________________________________________________________________

- Update Readmes & Diodes for all repos (oyster & takeaway) — oyster diode project exist?
_________________________________________________________________________________________________________________________________________________________________

* A README.md file in the root folder of your repo
* The title of the project
* What the project is/what it does
* How to install it (what to clone, what to run to get all dependencies)
* How to run it (is it a command line tool? Do you have to load it into IRB? Is is a web application? What port needs to be used?)
* How to run the tests


# Takeaway Challenge

This program controls the landing and takeoff of planes at an airport.

## Motivations for this project

* Week 1 Makers Academy weekend challenge
* Demonstrate knowledge of Ruby
* Practise TDD
* Practise OOD & Write code that is easy to change
* Unit test classes in isolation using mocking

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

## Features

* Can see a list of items with prices
* Can select some number of several available dishes
* Can view an order summary with a breakdown of items ordered & quantities
* Can view basket
* Can view order total
* Can receive a text message on placing an order


## Getting started

1. clone rep to your local machine `git clone path-to-repo`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, `run bundle`

## Usage

App runs in the command line.
Run irb in terminal and `require './lib/takeaway.rb'`

## Running tests

Run tests using:
`rspec`

