require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new(restaurant) }
let(:restaurant) { double(menu: food_item) }
let(:food_item) { double(:food_item) }

  describe '#initialize' do
    it 'expects a user to have selected a restaurant to order from' do
      expect(takeaway.restaurant).to eq(restaurant)
    end
  end

  describe '#select_dishes' do
    it 'lets a user order dishes and cumulatively add the quantity' do
      takeaway.select_dishes(:food_item, 1)
      takeaway.select_dishes(:food_item, 2)
      expect(takeaway.selections).to eq({food_item: 3} )
    end

  end

end
