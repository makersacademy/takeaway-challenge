describe 'User Stories' do
  let(:takeaway) { Takeaway.new }
  # let(:dish) { Dish.new }
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  context 'so I can check if I want to order something' do
    it 'i can get a list of menu items' do
      expect(takeaway.menu).to_not be_empty
    end
    it 'the menu items have prices' do
      expect(takeaway.menu).to all have_key :price
    end
    it 'the menu items have names' do
      expect(takeaway.menu).to all have_key :name
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'so that I can order the meal I want' do
    it 'I can select from particular quantities of the available dishes' do
      dish = takeaway.menu[3]
      takeaway.add_to_order(dish, 2)
      expect(takeaway.get_order.count(dish)).to eq 2 
    end

    it 'it raises an error if I order something not on the menu' do
      expect { takeaway.add_to_order("", 1) }.to raise_error "Cannot add to order: item is not available. Select items from the menu."
    end
  end
end
