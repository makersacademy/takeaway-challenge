Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  MFM |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
The idea of this project was to simulate a takeaway. The user would be able to view the menu. Specify which items they would like from the menu and then finalise their order. When the order was placed a text message would be sent using the Twilio API.
# Issues faced

I found this challenge incredibly difficult. After creating my initial domain models I struggled to write the tests for my classes in rspec. Initially I had stored the menu items in an array of hashes which was a massive error and made working with any of the menu items incredibly difficult.
For some reason I also thought that when you added an item to order you might also want to add more of that item to the order later, and whilst it seems like a nice feature it proved almost impossible to implement in the way that I had originally written my code.
After getting as far as User story 2 and spending a long time writing and testing code that had trapped me in a corner I decided the best course of action would be to look at the Makers Academy example and the example video.

After looking at the arrangement of the classes and the methods within those classes I had a better idea of how this challenge should have been approached and was able to re-write my code although it drew most of the basic functions from the example below.

https://www.youtube.com/watch?v=mgiJKdH9x8c

https://github.com/makersacademy/takeaway-exemplar/blob/master/lib/menu.rb

# Domain models


# Classes


# Modules


# How to use


# Future intentions
