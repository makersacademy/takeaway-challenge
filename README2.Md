My approach on #Takeaway Challenge

First I fork a repository from Makers channel to mine and I clone
that repository on my computer. Now that I have that repository on my
machine (Inside a dedicate folder called "PROJECTS") I start to set up
that folder in the useful way possible.

I run the command 'bundle' in the project directory (Takeaway-challenge)
to ensure you have all the gems.

I already have a .git and .spec file for save and check my progress.

I create a second README.md file (where we are now), to explain my approach
and a STORIES.md file where store all the user STORIES and check them quickly.

Inside a spec folder I create a .rb file under the spec control, takeaway_spec.rb
and inside a lib folder I create a takeaway.rb file where the ruby code lives.
I link this 2 files with a require command in takeaway_spec.rb.

My first think is , I want talk with Ruby and explain that I need a takeaway class.
I want to create an object equal to a real life situation.

Test first and we have to follow this logic:  

From Domain Model to feature test - for each features

* 1. Feature Test (IRB from command line) Red Light —>
* 2. Unit Test (spec file) Red Light —>
* 3. Write the instruction on “file_name.rb” for let the Unit Test pass —>
* 4. Unit Test Pass Green Light —>
* 5. Next Feature.

I create a method list_menu where I store , inside an hash, the menu.
I this way I have a key (dish) and a value (price).

Logic inside method :
1. ask for a order  
2. Store input       
3. If anserw = End , close the order  
4. Check if item is in the menu
5. Ask of quantity of items needs
6. Store input
7. Collect order - #{pizza: 3, rice: 2, beer: 1}
8. Ask for another items if needed
9. Total

I create a make_order where (for the moment), all the magic happen.
I create a loop where I ask for the costumer order and I store that inside an
instance variable (@order) , this choose let me to call this variable on
different stages inside my project.

I didn't implement the function for send a sms , but ideally I think I can
improve my program with a Method or with a Class where delegate this functionality
thanks to Twilio.
