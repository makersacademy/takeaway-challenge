describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can order something, list menu with prices' do
    burger_bar = Order.new

    expect(burger_bar.menu).to eq({
      "Hamburger" => 5,
      "Cheeseburger" => 6,
      "Bacon Burger" => 7,
      "Bacon Cheeseburger" => 8,
      "Hot Dog" => 3,
      "Veggie Burger" => 4,
      "BLT" => 6
    })
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

end
