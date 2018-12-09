describe 'User stories' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with

  describe 'so customers can order something' do
    it 'lists menu with prices' do
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
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  describe 'so customers can order a meal' do
    it 'selects some number of dishes and adds them to the basket' do
      burger_bar = Order.new

      expect { burger_bar.add_to_basket("Hamburger", 2) }.not_to raise_error
    end
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe 'so customers can verify that their order is correct' do
    it 'sums the prices of the dishes in the basket' do
      burger_bar = Order.new

      burger_bar.add_to_basket("Hamburger", 2)
      burger_bar.add_to_basket("BLT", 1)
      burger_bar.add_to_basket("Veggie Burger", 2)

      expect(burger_bar.total).to eq 24
    end
  end
end
