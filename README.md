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
Task
-----

* Fork repo
* Run the command 'bundle' in the project directory to ensure all gems are there
* Write a Takeaway program with the following user stories:

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
**My Approach**
-----

**Domain Model Diagrams**


**Responsibilities**

![Responsibilities](https://github.com/Sumner1185/takeaway-challenge/blob/master/ResponsibilityTable.png)


**Class Diagram**


![Class Diagram](https://github.com/Sumner1185/takeaway-challenge/blob/master/ClassDiagram.png)


**Example Flow**


![Example Flow](https://github.com/Sumner1185/takeaway-challenge/blob/master/ExampleFlow.png)


**Changes to plan as I progressed/Things learnt:**

* Needed to add a #price method to my Menu class so that it could be pulled across by Order to sum the total.
* #add method in Order needs to take both the dish and quantity as parameters
* Use "%s %.2f" syntax to print menu with 2 decimals for price
