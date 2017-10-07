require 'dishes.rb'

describe Dishes do
  subject(:dishes) {described_class.new}

  describe 'menu list' do
    let(:dish1) { {dish: "curry", price: 1.00 } }

    it 'will show the menu list' do
      expect(dishes.menu_list).to include dish1
    end
  end

end
