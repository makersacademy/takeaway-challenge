require 'dishes.rb'

describe Dishes do
  subject(:dishes) {described_class.new}

  describe 'menu list' do
    let(:dish1) { {dish: "curry", price: 1.00 } }
    let(:dish2) { {dish: "xcurry", price: 1.00 } }

    it 'will show the menu list' do
      expect(dishes.list).to include(dish1, dish2)
    end
  end

end
