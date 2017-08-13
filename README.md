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

Approach to solving the challenge
---------
This challenge was completed by attempting to use TDD for every new feature implemented. Through interpreting the user stories, I decided this task required at least two classes: Menu and Takeout. The Takeout class performed actions (such as adding, removing and seeing dishes) whereas the Menu class sourced information that could be provided to the takeout.

 
Difficulties
---------
I knew that this challenge would involve two principal difficulties, which were RSpec's 'doubles' and class-to-class interaction.

1. RSpec 'doubles'

   Doubles have been a difficult concept to grasp since learning about them earlier in the week. Of particular difficulty was learning how to make a particular instance of a double change its behaviour within a specific test in case multiple instances were required. 

2. Class-to-class interaction

   When completing the airport class in particular, a lot of thought had to be committed to working out how it would interact with both the plane and weather class. Problems emerged when trying to initiate new instances of the weather class within the airport initializer (as I thought at one point I needed this to occur), and this subsequently led to more impossible problems in my spec files. However, this actually led to substantial refactoring of my classes, which ultimately led to clearer, more efficient methods.

Future Developments
------------------
If I were to further develop this task, I would implement the following:

1. More menus
   
   The current app does not have more than one menu. The Takeout class could feature a "switch_menu" method, that could source dishes from other menus to then add to the order.

2. Using user input to order (through gets)
   
   This app would be much more interactive if users could just execute a "takeout.run" method, which would prompt the user to add/delete dishes to a basket, then accept certain inputs to checkout and complete the order.
   

Learning points
---------

  * Be clear on which classes can take which responsibilities
  * Keep your iterations "x.each do" clean so they can reveal intention