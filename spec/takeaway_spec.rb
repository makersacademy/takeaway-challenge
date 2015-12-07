require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, message: message) }

  let(:menu) { double(:menu, show: printed_menu) }
  let(:printed_menu) {'Classic Fondue : £13.0'}
  let(:order) { instance_double('Order', total: 13.0) }
  let(:message) { instance_double('Message') }
  let(:dishes) { {'Classic Fondue': 2,'Special Fondue': 1} }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with dishes and corresponding prices' do
    expect(takeaway.show).to eq(printed_menu)
  end

  it 'allows you to order several dishes from the menu' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
