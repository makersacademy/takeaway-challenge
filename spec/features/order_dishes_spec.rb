# xfeature 'Order dishes' do
#   scenario 'menu has dishes' do
#     pasta = Dish.new('Pasta', 5)
#     bolognese = Dish.new('Bolognese', 5)
#     salad = Dish.new('Salad', 2)
#     menu = Menu.new([pasta, bolognese, salad])
#     order = Order.new(menu)
#     order.add(pasta, 2)
#     order.add(bolognese, 2)
#     order.add(salad, 1)
#     order_list = "2 x Pasta, 2 x Bolognese and 1 x Salad"
#     expect { order.list }.to output(order_list).to_stdout
#   end
# end
