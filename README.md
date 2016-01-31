==PROGRAM INSTRUCTIONS==

pizza = Menu.new

- Creates a pizza menu

pizzahut = Takeaway.new(pizza)

- Creates new takeaway with pizza menu

pizzahut.show_menu
pizza.price('pizza')

- Show the menu and prices
- Show individual item price

pizzahut.order 'chicken', 4

- Orders 4 chickens & confirms  

pizzahut.basket_summary    

- Gives order overview

pizzahut.reset

- Reset order and start again

pizzahut.check_total

- Checks balance of order matches sum of products

pizza_hut.complete_order

- Completes order, confirms with text message
