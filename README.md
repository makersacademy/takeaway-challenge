Takeaway Challenge - Solution
=============================
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


Welcome to my solution for the takeaway challenge. Below I have explained how I approached the challenge, the process I followed and the learning outcomes achieved. 

Objective
---------
The objective of this challenge was to create a program which controls a takeaway shop so that customer can order from a range of dishes from the menu and also receive a notification when the order is ready and on its way. 


Progress and Learning Outcomes
------------------------------
This challenge was really fun to complete and much better than the previous weekend's challenge. I managed to apply myself in such a way as to use the knowledge gained in week 1 and building up on it throughout. 

I have learned the following during the completion of this challenge:

1. Gained a much deeper understanding of double, mocks and stubs by applying them robustly
2. Gained further understanding of SRP
3. Writing more robust tests with much ease
4. Further understanding of testing behaviour over state
5. Application of open closed principle


Program (Features and Functionality)
------------------------------------
The program allows to manage orders and menus in a takeaway. The program takes has various features but some of the main features are highlighted below

**Features Tests and User Stories**

Please follow this link for [Domain model, user story representations and feature tests](https://docs.google.com/document/d/1xdsNbkgjEgRXJ3Q6Doj-sVe1dx4ufXDi08aJuuOOc8U/edit?usp=sharing). 

**Classes**

The program has three classes which are menu, order and text. For each class the methods and features have been clearly defined in the code and have all been tested out. 

**Menu**

For every new menu, the program creates a menu_list which can be updated as necessary. The menu list has the dish, price and availability to order. 

**Order**

Order class controls the flow of orders from the customer. The customer can view the menu list and order the dish they want with number of portions. This class is also responsible for calculating the total order amount. 

**Text**

Once the customer has completed the order, the Text class comes in. This class is responsible for creating and sending a message to the customer with order confirmation and time of delivery. 


Challenges Faced
----------------

Overall, this challenge has been really fun. Some of the biggest challenges I faced are below:

**Twilio API**

This was my first experience of using an API to enhance the functionality of my program. It was very difficult to figure out at first, but I followed by instincts and applied myself. I approached this challenge with confidence and after only 1 hour of work, I was able to implement this API in my program. 

**Doubles and mocking**

Dependency injections is a concept that I really struggled with throughout the week. However, since I had a lot of work during the week on it, applying it in takeaway challenge was difficult but not impossible. 


Conclusion
----------

I am feeling very confident after this week that with the knowledge I have accumulated, even if I don't know everything, I can figure it out when I face a problem. This weekend I timeboxed myself which made solving the challenge very easy. I felt that I was more focused this week than week 1. 

I am looking forward to solving more challenged over coming weeks!

