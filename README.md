# TAKEAWAY CHALLENGE

This is a simple program that allows a user to place an order of at Nonna's Italian restaurant and sends them a message to confirm their delivery once they place the order.

Buon Appetito!!

# Requirments

Ruby '3.0.0'

# How to use

please install Bundler 
see here for more details https://bundler.io/

run `bundle install`

run `ruby './lib/food_delivery_ui.rb'`

Choose from the interactive menu and add dishes to your order. You can view your order and total and when you are ready place the order and have a text delivered to your phone to confirm.

# Issues I faced

The main problem I had with this challenge was implementing test for the commandline part of the program. couldn't figure out stubs for user input and couldn't do the advanced bit of ordering by text as i didn't have time as well as not testing the twilio API as couldn't mock the tests for a fake SMS 

It was nice to remember to use some ruby logic again for the UI and that took some time. My goal for the next week is to focus more on TDD and delve into stubs and mocks a bit more. The first class I created that the UI depends on was slightly easier to build but perhaps more test are needed to cover all edge cases. Especially after i took out most of the errors raised and put them in my UI file.

I enjoyed thinking about how my program would work and the domain model drawing. The functionality of the methods came quite smoothly but as I said, testing user input i just couldn't crack

Over all happy to have plodded through and defintely made progress with rspec but need to build up a lot more fluidity and dexterity. It all feels quite laboured and random. Lots of stabbing in the dark.