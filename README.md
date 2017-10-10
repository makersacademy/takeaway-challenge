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
 ## Delivery Order App
 Another Maker's weekend challenge which creates simple application for food ordering and notifies the user with an SMS for the expected delivery time. App uses Twilio API

## Classes

 - Dish
 > Creates the object dish which holds the name and the price

 - DishList
 > Holds a list of dishes

 - DishListParser
 > Reads a file with the available dishes, creates objects types of Dishes and parses them on a type of DishList list

 - Basket
 > Collects the items to be ordered 

 - Order
 > Orders the items and notifies the user with an SMS

 - Receipt
 > Creates a receipt of the ordered items

 - TwilioIntergration (module)
 > An abstraction layer for Twilio API
 
 - Defaults (module)
 > A list of default values for the app

 - Hidden (module)
 > Contains Twilio personal credentials and is not uploaded to repo

## How it runs
 ```ruby
# Parser reads the file dishes.csv and creates instances of Dishes which are being pushed in an array
# Parser can be instantiated with a file path. The defaults points out the pat where dishes.csv is in this project

parser = DishListParser.new
parser.parse_from_file
list = DishList.new(parser.list)

# DishList has a to_s method for convinience 
# it prints the available dishes
puts list

# Creates an instance of basket which will hold our items to be ordered
# it can be instantiated with an optional hash (item | quantity) 
basket = Basket.new

# The following lines add some dishes to the basket. We cover some edge cases as well
basket.add_item(list.dish_list[0])
basket.add_item(list.dish_list[0], 3)
basket.add_item(list.dish_list[8], 2)
basket.add_item(list.dish_list[13])
basket.add_item(list.dish_list[4])
basket.add_item(list.dish_list[4], -3)
basket.remove_item(list.dish_list[0])
basket.remove_item(list.dish_list[0])
basket.remove_item(list.dish_list[4], 6)
basket.remove_item(list.dish_list[17])
basket.remove_item(list.dish_list[9], 9)


# When the user finishes with item selection
# Order instantiation 

order = Order.new(basket)

# Order has a to_s method
puts order
# The argument in finalise_order indicates whether an sms will be sent or not
puts order.finalise_order(true)
```