require 'order'
require 'menu'

describe Order do

    subject(:order) { described_class.new }

    let(:menu) { double :menu }
  
    let(:selection) do
      {
        margherita: 2,
        hawaiian: 4
      }
    end

  context '#add_to_order' do  
    it "adds dishes selected from the menu to an order" do
      order.add_to_order(:margherita, 2)
      order.add_to_order(:hawaiian, 4)
      expect(order.selection).to eq(selection)
    end
  end

  context '#order_total' do
    it 'returns the total cost of order' do
      order.add_to_order("margherita", 2)
      order.add_to_order("hawaiian", 4)
      expect(order.order_total).to eq "Your bill: £57.94"
    end
  end
end