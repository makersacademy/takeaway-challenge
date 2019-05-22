require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 16.20) }

  let(:printed_menu) { "Burger: £6.20" }
  let(:dishes) { {burger: 1, pak_tod: 3} }

  it 'shows a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it "can order some number of several avaliable dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(16.20)
  end

end