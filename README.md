# Fooderoo
## The command-line food delivery app

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

How to use:
-------
1. Clone this repository, and install dependencies with bundle
2. Insert your Twilio credentials into the './lib/twilio_private_data_template.rb' file, and rename to './lib/twilio_private_data.rb'
3. To see menu, open irb and run:
```ruby
fooderoo = Fooderoo.new
fooderoo.show_menu
```
4. To select any number of items from the menu:  
```ruby
fooderoo.select 'Pizza Diavola', 2
```
5. Once you are happy with your selection, check the total cost of your order by typing:
```ruby
puts fooderoo.check_order 20
```
6. If the order total is as expected, you will receive a text message confirmation of the expected delivery time.
