Takeaway Challenge
==================
Second individual weekend challenge at Makers Academy. Based on the following user stories, I wrote a takeaway programme that uses Twilio to send text confirmation messages.

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

Instructions
---------------
* takeaway = Takeaway.new   # Automatically loads menu from CSV file and saves to variable 'menu.list'
* takeaway.view_menu  # Allows the user to view the menu, which contains dish, description, and price
* takeaway.create_order  # Creates new order object
* takeaway.select_dish(3) # Order creates an instance of selected dish and adds to basket
* takeaway.proceed_to_checkout #  Shows item list and sums total
* takeaway.place_order  # Confirms "order placed" and sends a text message confirmation with delivery time

Issues I encountered
------------------
* How to test that a file has been loaded. Is there a better way than menu.list.count?
* How to test that the output is correct when lengthy - is it enough to test that it outputs to STDOUT?
* How best to store dish objects. Initially I just stored the dish detail in hashes within the basket. I went back and changed it so that the basket stores the dish objects. If this were to be extended, for example, to customise each dish, would be better to store dish objects rather than hashes.
* Testing whether classes successfully send messages to other classes, i.e. using expect(obj).to receive(:message).
* Testing the sms.send_text method with mocks
