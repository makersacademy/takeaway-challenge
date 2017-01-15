describe "User stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "so customers can view dishes, displays a menu showing available dishes and prices" do
  takeaway = TakeAway.new
  menu = Menu.new
  expect{ takeaway.view_menu }.not_to raise_error
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it "allows customers to add available dishes to their basket" do
  takeaway = TakeAway.new
  basket = Basket.new({"Cheese Pizza" => 5.99})
  expect { takeaway.order(item).not_to raise_error }
end
end
