Write a Takeaway program with the following user stories:

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

For the list of dishes I referred to the rubric to get examples of items to include in the menu, just to save time on the non-code stuff.

I have included the menu in the initialize method, and an empty basket to begin with. However as I progressed I decided it was best to create a separate Menu class, as it was a separate class and in order to keep the Single Responsibility principle.

After going through my code I hit a point where I could not get my tests to pass to add items into the basket, so I thought of doing the same as I did with the Menu and create an Order class to keep the basket in. However I found it more difficult, maybe because I had already written the tests and code and found it more difficult to rearrange, although I know it is not the ideal code but it ran and the tests pass.

For the Twilio API I thought of mocking the Twilio code but was not able to complete further than the test written, which I'm also not sure if it is correct but I will test that further.
