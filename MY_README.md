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

Instructions
-------

This is the weekend challenge at the end of my second week at Makers Academy, a 16-week software developer bootcamp. For all the instructions, please refer to the main [README](https://github.com/AndreaDiotallevi/takeaway-challenge/blob/master/README.md).

Prerequisites
-------

* Fork this repository
* Clone the new repository into your machine with ```git clone```
* Run the command ```bundle``` in the project directory to ensure you have all the gems

Class Diagrams
-------

| Dish   | Menu      | TakeAway              | Restaurant      | TextProvider    |
| ---    | ----      | ---                   | ---             | ---             |
| @name  | @dishes   | @basket               | @takeaway       | @client         |
| @price |           | @menu                 | @text_provider  |                 |
|--------------------------------------------------------------------------------|
|        | add(dish) | read_menu             | checkout(price) | send_text(time) |
|        | list      | order(dish, quantity) |                 |                 |
|        | contains? | basket_summary        |                 |                 |
|        |           | total                 |                 |                 |
|        |           | correct_amount?       |                 |                 |
|        |           | empty?                |                 |                 |
|        |           | complete              |                 |                 |