describe "Feature tests" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can choose, show list of available dishes' do
    menu = Menu.new
    dishes_list = []
    dishes_list << Dish.new("Linguine alla carbonara col tartufo",15)
    dishes_list << Dish.new("Lasagne in bianco broccoli e salsiccia",12)
    # ...more dishes
    menu.dishes += dishes_list
    dishes_list_str = dishes_list.each { |dish| "#{dish.name.ljust(20,'.')}#{dish.price.to_s.rjust(3,'.')}\n" }
    expect(menu.list_dishes).to eq(dishes_list_str)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customer can order, select dishes and store selection' do
    menu = Menu.new
    dishes_list = []
    dishes_list << Dish.new("Linguine alla carbonara col tartufo",15)
    dishes_list << Dish.new("Lasagne in bianco broccoli e salsiccia",12)
    menu.dishes += dishes_list
    order = Order.new
    expect{order.dishes << {dish: menu.dishes[0], quantity: 2}}.not_to raise_error
    expect{order.dishes << {dish: menu.dishes[1], quantity: 1}}.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so customer can order, check order total match sum of dishes prices' do
    menu = Menu.new
    dishes_list = []
    dishes_list << Dish.new("Linguine alla carbonara col tartufo",15)
    dishes_list << Dish.new("Lasagne in bianco broccoli e salsiccia",12)
    menu.dishes += dishes_list
    order = Order.new
    order.dishes << {dish: menu.dishes[0], quantity: 2}
    order.dishes << {dish: menu.dishes[1], quantity: 1}
    expect(order.total).to eq 42
  end
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
