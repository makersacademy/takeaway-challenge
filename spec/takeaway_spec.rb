require 'takeaway'

describe Takeaway do
  subject(:takeway) { described_class.new }
  let(:pizza) { double :pizza }

  describe '#menu' do
    it 'can show a list of dishes with prices' do
      expect(takeway.menu).to eq(pizza: 6,
                              hamburger: 7,
                              curry: 5,
                              chips: 3,
                              cake: 4)
    end
  end

  describe '#current_order' do
    it 'is empty by default' do
      expect(takeway.current_order).to be_empty
    end
  end

  describe '#add_to_order(dish, quantity)' do
    it 'can add a quantity of a dish to the current order' do
      takeway.add_to_order(pizza, 1)
      expect(takeway.current_order).to include [ pizza, 1 ]
    end
  end
end
