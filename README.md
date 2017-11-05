Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

# Instruction

Go in ./lib/twiliosms.rb and add in the 12 line your number.
Then your terminal go with in the main folder, and run 'ruby takeaway_interface.rb'

IMG

IMG


# Approach

Read carefully the EX_README.md file
Made domains models for each user story
Read the 'Hints on functionality to implement' section in the EX_README.md file.
Followed TDD
Google a lot when struggling.

I've mainly followed the user tasks. They were quite clear and initially i wasn't sure if use an Hash or an Array to contain the list of foods and prices. Then I decided to use an array because more compatible with the idea to let choose
the food in base of their number.
The second issues that I had was test a method where there was a while loop based on an user input (gets.chomp). So I made some research and I understood how to stub it.
The third main difficulty was test twilio without receiving any sms.
I googled  but all the solution looked quite complicated, then i read the review file and followed the instruction.

## Make it better
Delegate the interface to another class
