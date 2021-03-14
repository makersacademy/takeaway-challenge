As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

*my approach was to create a constant in the form of TAKEAWAY_MENU which contained a hash of dishes and their prices*

** Constant would have proved too difficult to maintain, removed and inserted a hash in a separate method named menu

**I found further issues with this as it seemed to return nil, I suspect this is with how I've set my initial list, perhaps I need another class

*I then would create a method called list_menu that would print a list of dishes & prices*

** Moved the original hash from takeaway spec to a new spec named dishes and set it into a let statement for ease of access - *could not get this to work*

** Making a change to described_class to allow for easier class name changes later on

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

*I created an Order class that initialized with an empty basket*

*I added an add_item method that accepts arguments of dish and the quantity. It then adds that to the empty basket*


As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

*Impletemented a check_basket method to first print the contents of the basket then display the total by pushing the result of basket into total*

*Ran into an error whereby I couldn't coerce an Array or a String into an Integer, resolved this by using a grep to isolate the Integers of the array and then use reduce method found in Ruby to calculate the sum*
