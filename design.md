# Design Doc
## User Stories
- I would like to see a list of dishes with prices
- I would like to be able to select some number of several available dishes
- I would like to check that the total I have been given matches the sum of the various dishes in my order
- I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


takeaway

import menu from flat file

display list to user

user selects available dishes

display total and order

confirm

send text.


takeaway
  - .new(order_class, menu_class, message_class)
  - .new(menu_class)?
  - .see_menu
  - .add(dish,amount)
  - .check_order : compares current order against the menu?
  - .place_order
  - .set_phone_number(phone_number)

order
  - .new(menu_class)
  - .add(dish,amount)
  - .display_total
  - .place

menu
  - .select(dish,amount)   => price
  - display_menu
  - load_menu(file_name)
  - add_dish(dish,price)
  - change_dish_price

message (ovie voice)
  - .new(phone_number)
  - .send(message)

order_item (not needed)
  - @dish|| dish object
  - @cost|| dish object
  - @amount
  - .total

Dish/Price class
class Dish
  attr_reader :dish ,:price
  def initialize
  def set_price(price)
    @price = price
  end
end



