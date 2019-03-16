describe 'User Stories' do
  let(:takeaway) { Takeaway.new }
  let(:dish) { Dish.new }
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  context 'so i can check if i want to order something' do
    it 'returns a list of menu items' do
      expect(takeaway.menu).to_not be_empty
    end
    it 'returns things with prices' do
      expect(takeaway.menu).to all respond_to :price
    end
  end

end
