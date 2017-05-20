require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu, list: "test") }

  describe '#select_food' do
    it 'selects an item from the menu list' do
      expect { order.select_food(:vegan_cheese_platter, 4) }.to change { order.order_list.length }.by 1
    end
  end
end
