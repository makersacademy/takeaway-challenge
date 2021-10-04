My code accomplishes all the user stories and sends a text via Twilio on confirmation. 

Process -->

I knew that I wanted the order class to be dependent on the menu and the menu on order and order on dish, so I wrote each class in reverse order beginning with the dish. I injected dependency as I went and used mocking to isolate tests in rspec (or to the best that I could)

The menu, and dish classes mainy just created instances of themselves. The rest of the functionality was added to the order class as that was where the user would be "interacting" with the program -- which allows the user to start a new order (defaulting to a small "Mcdonalds" menu) and add items to their order, check their order total and submit their order to receive an order confirmation via text.

I then added a confirmation class to handle the creation and sending of a confirmation text as well as the Twilio api. 

I added code to raise errors through the order process to prevent edge cases and misordering -- I don't think I got them all, but atleast the biggest ones.