require 'Takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order, total: 11, basket: [dish, other_dish] }
  let(:dish) { double :dish, name: "Green Curry", price: 5 }
  let(:other_dish) { double :dish, name: "Red Curry", price: 6 }
  subject(:takeaway) { described_class.new(menu, order)}

  describe '#complete_order' do
    it 'should send a text to the user confirming their delivery time' do
      expect { takeaway.complete_order }.not_to raise_error
    end
  end

end
