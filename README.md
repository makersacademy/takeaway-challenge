# Hi! Thank you for reviewing my code!

I'm aware I need to refactor the massive Order class. I'm just happy I got it working.

Phone won't work unless you edit the environment variables to some valid account_sid and auth_token for twilio. Even then, the spec files mock Phone, so it won't text me.

Order takes on a lot of dependency injection, from all the other classes. When you call #take_order on an instance of Order, it uses MenuDisplay to list the Menu, then asks the user for input (you can check this out in irb), interprets this and asks Totalizer to calculate the total. If the total is correct, it asks Phone to send the text. Finally it asks OrderDisplay to display the order (not formatted yet: just a bare hash.)

It's the interpretation of the user input that calls for so many methods inside Order. If I were to refactor I should perhaps create an Interpreter or Analyzer class for Order to call.
