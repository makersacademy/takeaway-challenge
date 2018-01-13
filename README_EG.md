# **Ed Goold Takeaway Challenge Readme - 13.1.2018**

This readme summarises my solution to the Takeaway Challenge set for the second weekend of the Makers Academy's December 2017 cohort.

It is separated into the following sections:

	1. Introduction & Requirements

	2. High Level Approach to Problem

	3. Gemfile

	4. Objects

	5. Methods

	6. The Twilio API

	7. Tests and Coverage

	8. Final Thoughts

	9. Code Review Request


## **1. Introduction & Requirements**

	This challenge consolidates learning to date on TDD/BDD techniques re: Ruby and Rspec while also introducing new elements concerning third-party APIs, here the Twilio messaging service.

	Requirements 

	The challenge concerns the creation of a takeaway order system that will meet the following requirements:

	- that a customer is able to see a menu, listing dishes and their prices;

	- that a customer is able to order from the menu by selecting a number of available dishes;

	- that a customer can verify that the total provided is correct; and

	- that a customer can receive a verification text that their order will be delivered on time.

## **2. High Level Approach to Problem**

	Following learning to date, I have attempted a strict TDD/BDD led solution to the problem, involving the creation of the following objects and their corresponding spec files:

	- menu.rb / menu_spec.rb

	- order.rb / order_spec.rb

	- text.rb / text_spec.rb

## **3. Gemfile**

	- I have included the twilio-gem 5.6.0 into the gemfile, which will be available on bundle install.

## **4. Objects**

	I have created the following objects for this application, that, in high level summary, provide for the following:

	- Menu - stores a list of prices and displays those when called;

	- Takeaway - order and running total functionality for the customer; and

	- Text - verifying the customer's order via Twilio text message.

## **5. Methods**

## **6. The Twilio API**

	This has been stubbed using the following technique:

## **7. Tests and Coverage**

	Test coverage details and thoughts:

## **8. Final Thoughts**

## **9. Code Review Request**


