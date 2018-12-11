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

## Instructions to run the program
-------

1. Clone this repo 'git clone git@github.com:emanuelegorga/takeaway-challenge.git'
2. Change directory 'cd takeaway-challenge'
3. Run bundle to install dependencies 'bundle install'
4. Enjoy the program and your food ordered


### Domain model diagramming
-------
![diagram](https://user-images.githubusercontent.com/40179292/49704851-3d203f80-fc10-11e8-8701-8b63ef95d2f3.png)


### Get started
-------
1. Require the main file and create a new customer: require './lib/restaurant'<br/>
![2](https://user-images.githubusercontent.com/40179292/49704089-62a84b80-fc06-11e8-836d-534555c67b17.png)<br/>
2. To have a look at the menu use the method 'check_menu': 'customer.check_menu'<br/>
![6](https://user-images.githubusercontent.com/40179292/49704171-8fa92e00-fc07-11e8-98ed-f722f693641e.png)
3. Use the 'place_order' method to make your order and you'll be asked what would you like and how many of that item you want: 'customer.place_order'<br/>
![3](https://user-images.githubusercontent.com/40179292/49704147-21fd0200-fc07-11e8-9b42-1d647b1ed547.png)<br/>
4. Once you have completed your order type in the word 'completed'. This is how a correct order will look like:<br/>
![4](https://user-images.githubusercontent.com/40179292/49704215-0ba37600-fc08-11e8-90e0-4c5f0729818f.png)
5. If you want to see your order and receive a confirming text use the method 'check_order':<br/>
![5](https://user-images.githubusercontent.com/40179292/49704225-2d9cf880-fc08-11e8-8000-e6948479fea7.png)
