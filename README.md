Takeaway Challenge

As part of Makers' Bootcamp, the Takeaway Challenge expects students to make a small, simple food ordering app that'll send a confirmation SMS when the order's complete.

Instructions
-------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

Difficulties
-----
For the moment, my app is not complete. I failed to implement TDD and DDD approaches which cost me time and effort down the line. The app is working but is not completely tested with Rspec as I experienced difficulties with 'stub', 'gets', 'chomp' and 'while' in Rspec.

Moreover, Twilio returns an error for me : saying that my smartphone does not support text messaging. I am not sure of the cause of this error message. At this time, I could not find any solution to this problem.

To Improve Next Time
-----
I realised that diagramming is definitely something I want to do before starting a project. Especially as a beginner. I'll start each new project by a handmade scheme that should help me during the whole project. In the same way, TDD approaches can help me seeing clearer in what responsibility each method should bear.

I also realised that I could learn more about Rspec and Twilio API. I need to read more about it and train myself to have better and clearer understanding of these tools. In the end, it'll help me improve my code while significantly reducing the efforts put into it.