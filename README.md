[![Build Status](https://travis-ci.org/Alex-Swann/takeaway-challenge.svg?branch=master)](https://travis-ci.org/Alex-Swann/takeaway-challenge)          [![Coverage Status](https://coveralls.io/repos/github/Alex-Swann/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/Alex-Swann/takeaway-challenge?branch=master)



# Takeaway Challenge
==================

### Installation Instructions
-------
<ol>
<li>Fork repo to your own GitHub account</li>
<li>Clone repository to your system and create a local repository</li>
<li>Use RVM to to either use/install Ruby version 2.3.1; e.g. <code>rvm use ruby-2.3.1</code> or <code>rvm install ruby-2.3.1</code> </li>
<li>Run <code>bundle install</code>. If this fails, then run <code>gem install bundler</code> if you don't have Bundler!</li>
</ol>

## Program Outline
-------
The interface for the program allows you to create a menu from an API containing food and price values using MenuBuilder. From this the MenuSelector selects items the user wants from the created list which are sent to SumItems to calculate a total. This total and the items selected can be used to create a receipt. A text confirmation can also be sent using the Twilio gem.

## How to Use
-------
1. Run <code>'irb'</code> or <code>'pry'</code>
2. From root directory of repo, <code>require './lib/menu_selector.rb'</code>
3. To initialize your takeaway: <code>order = MenuSelector.new;</code> (N.B. semi-colon at end suppresses return values if you want!)
4. To view the menu: <code>puts order.menu;</code>
5. To select from the menu: <code>order.select</code>
6. The select function uses TTY-Prompt, use up/down arrow keys to move between menu items, space to select/deselect, and enter to confirm.
7. To view a receipt of your order: <code>puts order.receipt;</code>
8. To have a text of your order sent: <code>order.text</code>
9. For text functionality to work, create a hidden <code>.env</code> file to store your SID and Auth token for Twilio.
10. To see logs of text sent to the takeaway from customer's mobile, instantiate a log object: <code>log = TextLogs.new</code>
11. You will need to ping Twilio for its logs to be sent to you <code>log.run_logs</code>
12. Then lastly, you can print a log of all orders requested by customers: <code>log.received;</code>

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

### Coveralls
-------
You can run coveralls on your local repo to test how much test coverage is going on in the scripts So far I've managed to test it in the range of 97-98%. Anything >95% is considered good test coverage. Run the code below in your CLI to see the test coverage if you decide to change or add more features to the current program.

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

