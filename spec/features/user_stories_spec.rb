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
      expect(takeaway.basket.count(dish)).to eq 2 
    end

    it 'it raises an error if I order something not on the menu' do
      expect { takeaway.add_to_order("", 1) }.to raise_error "Cannot add to order: item is not available. Select items from the menu."
    end
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  context 'so that I can verify that my order is correct' do
    before do
      [[0, 1], [1, 3], [2, 1], [4, 1], [5, 1]].each do |item, quantity|
        takeaway.add_to_order(takeaway.menu[item], quantity)
      end
      @total = takeaway.basket.map { |item| item[:price] }.sum
    end

    it 'it gives me confirmation if I give the correct price' do
      # p takeaway.get_order
      # p @total
      expect(takeaway.verify(@total)).to be true
    end
    
    it 'raises an error if my price is wrong' do
      expect { takeaway.verify(@total + 1) }.to raise_error "Cannot verify order: the price was wrong. Check your maths! 😜"
    end
  end  
end
