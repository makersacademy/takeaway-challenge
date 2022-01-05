## I would like feedback on the following:

* Are my classes coupled enough?

* Are they loosely coupled?

* Could I have further broken down my classes? Do they have a single responsibility? I feel they might be getting a bit large!

* How is my mocking? 

* Could I have used keyword arguments better to make my code more changeable later?

* How would these classes work together as a program if they are so loosely coupled. Do I need a customer ordering interface to implement the public methods of my classes? Or should one of my classes be doing this already e.g. restaurant?

* Am I accessinging my attributes correctly in my restaurant methods? Should I be using the method rather than the instance variable?

* I initialise my restaurant class with a pre-set menu. Is there a better way of doing this, e.g. with optional arguments or keyword arguments?

* In my tests, I have hard coded the costs of the menu. Is this reasonable or should I be using my doubles to do this? 

* I have two almost identical methods in my restaurant and basket classes – would I abstract this method out to a module here?

* How could I increase my test coverage?


*See pull request for feedback from peer and coach*
###Further coach feedback re: mocking the text message

Re; stubbing the text message, actually the only kind of test I would write for this would be something like this...
in your Restaurant class, or wherever you're calling the text sending code
```
def confirm_order 
	@message_class.send_text 
end
```
in your Restaurant tests...
```
it 'sends the user a text message once the order is confirmed' do 
	expect(message_class).to receive(send_text) 
	restaurant_instance = Restaurant.new(# any arguments)

	# anything else you need to do to set up a new order / basket

	restaurant_instance.confirm_order 
end
```
The idea behind this test is only testing the restaurant's behaviour: all it does is checks that that method to the text sending code is called, as that's all the restaurant is responsible for in relation to the message being sent. We don't actually test the text sending code here, as we might just manually test that once or twice while we're building it.

