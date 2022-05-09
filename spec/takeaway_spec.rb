require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Chicken £3.50" }
  let(:order) { double(:order, total: 15.50) }
  let(:dishes) { { chicken: 2, pizza: 1 } }

  describe "#view_menu"
  it 'allows me to view a menu' do
    expect(subject.print_menu).to eq(printed_menu)
  end

  describe "#place_order"
  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  describe "#order_total"
  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  # it 'sends an SMS when the order has been placed' do
  #   takeaway.place_order(dishes)
  # end

end
