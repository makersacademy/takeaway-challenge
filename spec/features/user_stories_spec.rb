describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "so a customer can see dishes and prices, instruct a takeaway to return a menu" do
    t = Takeaway.new
    expect { t.show_menu }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "so a customer can select available dishes, allow a customer to place an order" do
    t = Takeaway.new
    expect { t.order }.not_to raise_error
  end

end # of user stories describe block
