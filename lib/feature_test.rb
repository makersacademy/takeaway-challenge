require_relative 'takeaway_service'

account_sid = 'REDACTED'
auth_token = 'REDACTED'
from_phone = 'REDACTED'
to_phone = 'REDACTED'

thai_takeaway = TakeawayService.new(
  TwilioService.new(account_sid, auth_token, from_phone),
  Restaurant.new(
    Menu.new(
      Dish.new('Tom yum soup', 4.50),
      Dish.new('Pad thai', 8.95),
      Dish.new('Pad see yew', 8.95),
      Dish.new('Egg fried rice', 3.89)
    )
  )
)

thai_takeaway.print_menu

my_order = thai_takeaway.create_order

my_order.add('Tom yum soup', 2)

my_order.add('Pad thai', 1)

my_order.add('Pad see yew', 1)

thai_takeaway.place_order(my_order,to_phone)
