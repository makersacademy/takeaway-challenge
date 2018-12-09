describe 'User stories' do
  let(:burger_bar) { Takeaway.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with

  describe 'so customers can order something' do
    it 'lists menu with prices' do
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
      expect { burger_bar.add_to_order("Hamburger", 2) }.not_to raise_error
    end
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe 'so customers can verify that their order is correct' do
    before(:each) do
      burger_bar.add_to_order("Hamburger", 1)
      burger_bar.add_to_order("BLT", 2)
      burger_bar.add_to_order("Veggie Burger", 1)
    end

    it 'displays the current basket' do
      expect(burger_bar.basket).to eq [
        "Hamburger", "BLT", "BLT", "Veggie Burger"
      ]
    end

    it 'sums the prices of the dishes in the basket' do
      expect(burger_bar.total).to eq 21
    end
  end
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text after I have ordered
