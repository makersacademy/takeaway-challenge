describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "so customers can place an order, they can see a list of dishes with prices" do
    takeaway= Takeaway.new(menu)
    expect { takeaway.print_menu }.not_to raise_error
  end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it "customers can select some number of several avaliable dishes" do
    menu= { "dish" => 3 }
    takeaway= Takeaway.new menu 
    amount= 3
    dish_number= 5
    expect { takeaway.select(amount, dish_number) }.not_to raise_error
  end
end