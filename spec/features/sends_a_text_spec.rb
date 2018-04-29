# feature 'Sends a text when order is confirmed' do
#   scenario 'order has dishes' do
#     pasta = Dish.new('Pasta', 5)
#     bolognese = Dish.new('Bolognese', 5)
#     salad = Dish.new('Salad', 2)
#     menu = Menu.new([pasta, bolognese, salad])
#     order = Order.new(menu)
#     order.add(pasta, 2)
#     order.add(bolognese, 2)
#     order.add(salad, 1)
#     time = Time.now
#     expect { order.confirm }.to output("Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}").to_stdout
#   end
# end
