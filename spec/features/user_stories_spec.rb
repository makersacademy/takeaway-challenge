describe 'User Stories' do
  let(:takeaway) { Takeaway.new }
  # let(:dish) { Dish.new }
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  context 'so i can check if i want to order something' do
    it 'returns a list of menu items' do
      expect(takeaway.menu).to_not be_empty
    end
    it 'returns dishes with prices' do
      expect(takeaway.menu).to all have_key :price
    end
    it 'returns dishes with names' do
      expect(takeaway.menu).to all have_key :name
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'so that i can order the meal i want' do
    it 'i can select from the available dishes in a particular quantity' do
      dish = takeaway.menu[3]
      takeaway.add_to_order(dish, 2)
      expect(takeaway.get_order.count(dish)).to eq 2 
    end

    it 'if i order something not on the menu it raises an error' do
      expect { takeaway.add_to_order("", 1) }.to raise_error "Cannot add to order: item is not available. Select items from the menu."
    end
  end

end
