require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:items)     { {Cheeseburger: 1, Fries: 2}}
  let(:order)     {double (:order)}
  let(:place_order) {double (:place_order)}

describe '#menu' do
    it 'brings up list of dishes with prices' do
      menu_items = "Cheeseburger £5.00, Fries £3.00, Milkshake £2.99"
      expect(takeaway.show_menu).to eq(menu_items)
    end
    end

describe '#order' do
    it 'selects a number of the available dishes' do
      takeaway.add(:'Cheeseburger', 1)
        expect(takeaway.order).to include('Cheeseburger': 1)
      end
    end
end
