# User stories and process

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

Objects | Messages
Menu      See the list with prices

This was a straightforward task which I was able to complete pretty easily.

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Objects | Messages
Order     choose some dishes

I changed where this method lived a few times - initially it started in menu, then went to Order class with Takeaway forwarding info to it.

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

Objects | Messages
order     total
Takeaway  check_total

This was the most challenging of all user stories for me, as I again struggled with which class it should live in and how to make it function when it needs information from 2 different classes. I had it as a separate method in Order class but the return value kept only returning for the final figure so I put it in 'place' method for now.

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
Objects | Messages
Takeaway  place

I was excited to try out the use of this API, which was much easier than anticipated. I haven't had a chance yet to create the conditional with a guard clause to stop the text sending if the totals don't match, and also haven't created the appropriate test.

# Conclusion

I really consolidated my knowledge about classes and how they work through this task, and about encapsulation. I still need to practice more about how classes 'talk' to each other e.g. delegate, forward, and polymorphism.

I was test-driven for the first part of the challenge, but as I started experimenting with options and functionality in different ways this was difficult to keep up. However, I was able to let go of previous 'rigid thinking' I had with the TDD process and therefore truly understood the value of both unit and feature tests in combination to make a robust and efficient program.
