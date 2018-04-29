feature 'Total an order of dishes' do
  scenario 'order has dishes' do
    pasta = Dish.new('Pasta', 5)
    bolognese = Dish.new('Bolognese', 5)
    salad = Dish.new('Salad', 2)
    menu = Menu.new([pasta, bolognese, salad])
    order = Order.new(menu)
    order.add(pasta, 2)
    order.add(bolognese, 2)
    order.add(salad, 1)
    expect(order.total).to eq 22
  end
end
