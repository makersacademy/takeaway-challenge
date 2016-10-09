require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Lasagne: £4.5" }
  let (:dishes) { {lasagne: 4, risotto: 3} }

  it 'returns the items in the menu' do
    expect(subject.print_menu).to eq(printed_menu)
  end

  it "returns an order with some number of several available dishes" do
    expect(order).to receive(:add).at_least(:once)
    takeaway.place_order(dishes)
  end
end
