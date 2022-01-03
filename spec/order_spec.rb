require 'order'
require 'menu'

describe Order do
  subject (:order) { Order.new }

  it 'is an order' do
    expect(order).to be_an Order
  end

  order_summary = <<~ORDER
    Your current order:

    Beef burger: 14
    Fries: 4
    Milkshake: 5

    Order total: 23
  ORDER

  describe '#summary' do
    it { is_expected.to respond_to(:summary) }

    it 'does not show if order is empty' do
      expect { order.summary }.to raise_error "Your order is empty"
    end

    it 'shows the current order' do
      allow(order).to receive(:summary) { "Order summary" }
      expect(order.summary).to eq "Order summary"
    end

    menu = Menu.new
    menu.select(1, 4, 6)
    specify { expect { menu.order.summary }.to output(order_summary).to_stdout }
  end
end
