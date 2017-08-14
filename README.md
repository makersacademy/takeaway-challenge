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


  1. Twilio API
    
  This was the first time using Twilio, and integrating an unfamiliar gem into a project required some time to understand it first. Once texts were being successfully sent within my IDE, there were some challenges in integrating it into my own app. This was eventually achieved through placing all necessary code into a "Texter" class, which was then executed within the Takeout class upon checking out.
  
  2. Maintaining trajectory
  
  It felt very easy to get carried away in this task, as the user stories felt quite open to interpretation. This led to me temporarily veering off-course and attempting to over-complicate my app, rather than keeping it simple and effective. Of course, this led to future difficulties when implementing new functionality, as substantial code would need to be altered to allow it to work. 
  
  Some of this code still exists in my final version - some methods are messier than ideal - and so it is important to be more structured and clear as to both what is and is not necessary to be implemented in future projects.


Future Developments
------------------
If I were to further develop this task, I would implement the following:

1. More menus
   
   The current app does not have more than one menu. The Takeout class could feature a "switch_menu" method, that could source dishes from other menus to then add to the order.

2. Requiring user input to order (through 'gets)
   
   This app would be much more interactive if users could just execute a "takeout.run" method, which would prompt the user to add/delete dishes to a basket, then accept certain inputs to checkout and complete the order.
   

Learning points
---------

  * Be clear on which classes can take which responsibilities
  * Keep your iterations "x.each do" clean so they can reveal intention