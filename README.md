Takeaway Challenge  
==================

How to Use
----
- Download and bundle install
- Navigate to project folder and run `irb -r ./lib/main`  
- Type `OrderProcess.start`  
- Follow on-screen instructions

_Note: Twilio integration will not work, as authentication credentials and phone numbers are stored locally in .env  
User can add their own Twilio account credentials to .env and program will work_

Approach 
----
There are 6 classes within the program: `OrderProcess`, `Order`, `OrderItem`, `Menu`, `MenuItem`, and `Messager`.
Their roles are as follows:

**Order Process**  
- The file to be loaded at startup, this contains code for the interface the user would see.   
- This should have extensive feature tests to go with it, but I ran out of time to write these in rspec (program has been extensively/constantly tested in irb though!)
 
**Order**  
- Has methods `create_order_item`, `calculate_total`, and `confirm`.  
- `confirm` triggers the SMS confirmation message method on the `Messager` class.
- `calculate_total` takes each `order_item` in the `@o_items` array, and calculates the item price by quantity before returning the sum total of all items as a string. The `total` variable is formatted to become a float to 2 decimal places.  
- `create_order_item` takes the `menu_item` and `quantity` passed to it (in `OrderProcess`, this is given by the user input). It creates an instance of `OrderItem` which gets added to the `o_items` array.

**Messager**  
- A simple class to hold the Twilio integration. This has primarily been made as its own class to allow for basic (and free) testing.  
- Phone numbers and Twilio account credentials are redacted, and are locally held in the .env file.

**Menu**  
- `Menu` takes a .csv file as its data input source, rather than having items hard-coded.  
- The `load_from_csv` method parses each row and pushes a hash of each row (comprising a menu number, dish name, and price) into the instance variable `@m_items`.   
- Items from `@m_items` are retrievable via their assigned key, which is the corresponding menu number.  
- The menu number could have been left out and access could have been via the index number of an array such as `["dish name 1", "price 1"]` for example; however a csv allows a restaurant's own indexing type to be used rather than just numeric values.

**Menu Item and Order Item**  
- These classes are intentionally created as distinct from `Menu` and `Order`.  
- This is to allow additional functionality to be added easily, such as a customer adding notes to an `OrderItem` ("extra cheese" or "double pepperoni"), or if multiple menus were in use (e.g. drinks menu, dessert menu, set menu etc.)  
- Although very similar to `MenuItem`, `OrderItem` is initialized with an additional `quantity` argument.  
- `OrderItem` also takes named parameters, to ensure `quantity` and `number` are not confused.

**Notes**  
The below brief asks for an order total to be given by the user as part of the list of dishes and their quantities, and to throw an error if the total they give does not match the program's calculated total. To more closely match a takeaway ordering process I've left the calculation to the program.

Project Brief   
----
* Write a Takeaway program with the below user stories
* Ensure there is a list of dishes with prices
* Place the order by giving the list of dishes, their quantities and a number that should be the exact total.
* If the sum is not correct the method should raise an error
* If the sum is correct, the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
* If the Takeaway is loaded into IRB and the order is placed, a text confirming the order should actually be sent
* Extension task:
 * Implement the ability to place orders via text message.



User Stories  
-----
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

