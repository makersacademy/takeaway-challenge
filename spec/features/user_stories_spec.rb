describe "user_stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'so I can check if I want to order, see a list of dishes with prices' do
    order = Order.new
    dish = Dish.new
    expect { order.print(dish) }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "so I can order a meal, I want to select dishes from a list" do
    order = Order.new
    dish = Dish.new
    expect { order.select(dish) }.not_to raise_error
  end

end
