# Takeaway Challenge Readme

My approach to this was to use the IRB to communicate the missing methods and then use the TDD approach to green light methods before refactoring. 

I initially decided that I should split the project up into 5 classes: 

1. Menu
2. Messager
3. Printer
4. Takeaway

The majority of the workings would be in takeaway.rb with the printer taking ownership of printing the ‘receipt’ for the customer to check and the menu being only the menu. This would allow changes to the menu independently from the restaurant class. 

I drew up a plan before beginning using Miro. 

* User stories at the top.
* Classes in Pink
* Initialise methods in green
* Methods in blue

Having tried for a long time to get the @dishes hash to give me the price so I could sum, I had to give-up for time and stub these amounts in my tests. (see takeaway_spec.rb)

I found this super challenging and in the time I could give this weekend, this was what I could do. I'm not convinced some of my code choices were correct, and that may have hindered my progress and brought me trouble! 

