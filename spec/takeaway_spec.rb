require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, :print => printed_menu) }
  let(:order) { instance_double("Order", :total => 25.50) }
  let(:printed_menu) { "Pizza: £19.50" }

  let(:dishes) { { Pizza: 2, Falafel: 1 } }

  it 'shows menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    allow(order).to receive(:add).twice
    takeaway.place_order(dishes)
    # expect(takeaway.place_order(dishes)).to eq("Your order is for £25.50")
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(25.50)
  end

end