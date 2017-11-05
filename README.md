# Weekend Challenge 2: Takeaway
=============================

## Introduction

The second weekend challenge was to create software to be run in the command line, to manage a takeaway app. There would be four bits of functionality to implement:

* Viewing a list of dishes with prices
* Selecting one or more available dishes
* Checking the total is equal to the various dishes
* Sending the user a text message with confirmation of their order

For more information on the specifics of the challenge, see the [Instructions](https://github.com/peterwdj/takeaway-challenge/blob/master/Instructions.md).


## Approach

Throughout the week, I had struggled with classes that lost sight of what their purpose was; functionality lived in the wrong places, and my code had rapidly become spaghetti-like. I had struggled with converting the theory of domain modelling, with which I feel comfortable, to the practical application thereof.

I therefore took a holistic view of the project from the start, looking at what needed to be implemented, and distilling each user story into what was actually being asked of the system. This left me with three classes:
* A Menu class - to load a menu from a file and display it to a user
* A Basket class - allowing users to add items from the menu to their basket, and view which items are in it
* An Order class - allowing an order to be placed, which sends a confirmation SMS to the user and telling the Basket class to reset the current order

Diagramming this out on paper beforehand gave me a much clearer mental model of how the code would work: the responsibilities of each class, and how they would talk to each other.


## Challenges

Some of this weekend's biggest challenges came with RSpec - specifically, testing for (and stubbing) loading a CSV file, and testing that a text would be sent to a user. Googling around the former did not yield very many results (and often dived into why testing using frameworks were a bad practice altogether); as a result the test is currently long-winded and unscalable. The second was solved by creating a variable that would store the body of the SMS sent to the user after a message had been sent, and then checking the value of that variable using RSpec. I found that, whilst this solution worked, it was unsatisfactory as it did not truly test if a text had been delivered to a user - only that the message that was supposed to have been sent was what it said it was. However, I was able to find no other way to properly test this, other than simply by doing it in PRY.

Another challenge from this week was installing and configuring the Twilio gem. This one was more staight-forward to overcome, though - I was able to quickly find answers and solutions to the errors I was having on Stack Overflow when installing the Gem. The actual implementation of the Gem within the code was also something that I felt the documentation left the user thrown-in at the proverbial deep end with, but through trial and error I was able to discover which lines of code needed to live in which methods, and successfully add the ability to send a confirmation text message to the user. 
