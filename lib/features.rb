#feature test takeaway-challenge
require_relative 'take_away'

take_away = TakeAway.new

# user story 1
take_away.show_menu

# user story 2
#interactive ordering proces
take_away.enter_order

# show enmtered order
take_away.order

#user story 3
#build hash with dishnumber as key and description and
# price as value from csv file
take_away.create_dish_hash

take_away.order_total

take_away.order_specification
