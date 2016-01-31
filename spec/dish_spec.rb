require 'dish'

describe Dish do
  subject(:dish) {described_class.new}
  before do
    dish[:name] = 'Chow Mein'
    dish[:price] = 3.99
    dish[:selected] = false
  end
  context '#initialize' do
    it 'has a dish name' do
      expect(dish.name).to eq 'Chow Mein'
    end

    it 'has a price' do
      expect(dish.price).to be(3.99)
    end

    it 'has a selected status' do
      expect(dish.selected).to be_falsey
    end
  end

  context '#set_selected' do
    it "changes the dish's selected status" do
      dish.set_selected
      expect(dish[:selected]).to be(true)
    end
  end
end
