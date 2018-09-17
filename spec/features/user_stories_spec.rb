describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I can order something, see a list of dishes and prices' do
    menu = Menu.new
    expect { menu.show }.not_to raise_error
  end

  it 'should add a dish (including name and price) to the menu' do
    menu = Menu.new
    dish = Dish.new("Lasagna", 10)
    menu.add(dish)
    expect(menu.show).to eq([{ "Lasagna" => 10 }])
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'should let you order a meal from the list' do
    menu = Menu.new
    dish = Dish.new("Lasagna", 10)
    menu.add(dish)
    dish = Dish.new("Pasta", 8)
    menu.add(dish)
    order = Order.new
    order.pick("Pasta", 2)
    expect(order.show).to eq([{ "Pasta" => 2 }])
    order.pick("Lasagna", 1)
    expect(order.show).to eq([{ "Pasta" => 2 }, { "Lasagna" => 1 }])
  end
  #
  # it "should return an error if the meal isn't on the list" do
  #  order.pick("Pizza", 1)
  # end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'should return the total sum' do
    order = Order.new
    order.pick("Pasta", 1)
    order.pick("Pasta", 1)
    order.pick("Lasagna", 1)
    expect(order.quantity).to eq(3)
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it "should receive a text" do

  end
end
