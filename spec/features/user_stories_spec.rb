describe "user_stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'so I can check if I want to order, see a list of dishes with prices' do
    menu = Dish.new
    expect { menu.menu }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "so I can order a meal, I want to select dishes from a list" do
    order = Order.new
    dish = "lamb"
    expect { order.select(dish) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given
      # matches the sum of the various dishes in my order

  it "verify that order is correct and check that sum is correct" do
    order = Order.new
    expect { order.print }.not_to raise_error
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as
  # "Thank you! Your order was placed and will be delivered before 18:52"
  # after I have ordered

  it "submits the order and sends a text message" do
    order = Order.new
    expect { order.send_text }.not_to raise_error
  end

end
