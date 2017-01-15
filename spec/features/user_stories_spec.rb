describe "User Stories" do
  # # As a customer
  # # So that I can check if I want to order something
  # # I would like to see a list of dishes with prices
  # # NB. Ensure you have a list of dishes with prices
  it "so a customer can see dishes and prices, instruct a takeaway to return a menu" do
    t = Takeaway.new
    expect { t.menu }.not_to raise_error
  end

  # # As a customer
  # # So that I can order the meal I want
  # # I would like to be able to select some number of several available dishes
  # # NB. Place the order by giving the list of dishes, their quantities and a number that should be the exact total.
  it "so a customer can select available dishes, allow a customer to place an order" do
    t = Takeaway.new
    dish = "Pizza"
    t.order(dish)
    expect{t.order(dish)}.to change{ t.basket } 
  end

end # of user stories describe block
