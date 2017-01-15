describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  # NB. Ensure you have a list of dishes with prices
  it "so a customer can see dishes and prices, instruct a takeaway to return a menu" do
    t = Takeaway.new
    expect { t.menu }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  # NB. Place the order by giving the list of dishes, their quantities and a number that should be the exact total.
  it "so a customer can select available dishes, allow a customer to place an order" do
    t = Takeaway.new
    dish = "Pizza"
    quantity = 1
      expect{t.order(dish, quantity)}.to change{ t.basket }
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "so a customer can view their order summary" do
    t = Takeaway.new
    dish = "Pizza"
    quantity = 1
    t.order(dish, quantity)
      expect { t.order_summary }.not_to raise_error
  end






end # of user stories describe block
