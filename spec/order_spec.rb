require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double :menu }
  let(:menu_class) { double :menu_class, new: menu }
  let(:dish) { double :dish }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:selected) { double :selected }
  let(:quantity) { double :quantity }

  describe '#add_to_order' do
    it 'adds selected item to meal order' do
      allow(menu).to receive(:add_dish).and_return(:dishes)
      allow(menu).to receive(:display).and_return(:dishes)
      allow(menu).to receive(:choose).and_return(:order)
      expect(order.add_to_order(dish, quantity)).to be_truthy
    end
  end

  describe '#calculate_total' do
    it 'calculates total cost of order' do
      allow(menu_class).to receive(:choose)
      menu_class.choose(2, 3)
      menu_class.choose(3,4)
      allow(order).to receive(:calculate_total).and_return 32
    end

  end

end
