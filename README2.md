Takeaway Challenge
==================
```

Introduction

I began by thinking about the user stories and the functionality they imply. 
I summarised the nouns(objects) and verbs(methods) against suggested classes 
on a piece of paper of first of all. This allowed me to make a quick start 
and change things quickly.

Once I had a rough sketch of the architecture, I formalised it on drawio 
(https://app.diagrams.net/#G17wSsZ0ACXd_0gc3a-v9S4KkjGQvQ8mYR).

To help me maintain functionality and enable unit and feature tests from the 
start, it was important I started with the class that had no dependencies, 
ie the dish class.

Coding

I TDD'd the Dish class, which produces dish objects, eg { "Chicken Korma", 8.99 }

Then I TDD'd the Menu class, which produces a list of dishes. Tests were isolated.

Then I TDD's the Order class, which acquires a menu, and has functionality 
like 'add dish to order' and 'show total'. Tests were isolated.

The above steps were straightforward. The place_order method of Order requires 
the sending of an sms. Working with twilio, the text messaging app, was more 
challening. I spent some time researching environment variables, then used the 
twilio tutorial to enable text messages to be sent manually. Integrating it 
(so that texts would be sent automatically) was difficult, as there were many 
errors, and I wasn't clear of the cause. Once I had used information in the 
error messages to get it to work, I then hashed it out and TDD'd it. Technically
this violated the red-green-refactor process of TDD, but I didn't know in 
advance what I was going to be testing. In particular, I took the sample code 
provided by twilio and turned it into a regular ruby class with methods. This 
standardised the formatting and made it easier to test. I wrote isolated tests.

Notes

The send_sms test for send_sms (line 21) is circular, becuase it only tests the
output of something defined in the line above it. However, the test is not 
redundant, because without this 'dead-end', the unit test would run the actual 
code, and result in an actual text message being sent - the specification 
required that this did not happen. 

Coverage is 99.15% overall, including the circular test described above.

Coverage for the send_sms.rb file is 92.86%. 1 line is missing a test, line 20, 
but this seems minor.
