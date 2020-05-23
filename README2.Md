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

1. Feature Test (IRB from command line) Red Light —>
2. Unit Test (_spec file) Red Light —>
3. Write the instruction on “file_name.rb” for let the Unit Test pass —>
4. Unit Test Pass Green Light —>
5. Next Feature.						
