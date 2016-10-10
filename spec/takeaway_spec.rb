require "takeaway"
require "order"
require "text"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, text: text) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 23.45) }
  let(:text) { instance_double("Text", deliver: nil) }
  let(:printed_menu) { "Lasagne: £4.5" }
  let (:dishes) { {lasagne: 4, risotto: 3} }

  before do
    allow(order).to receive(:add)
  end

  it 'returns the items in the menu' do
    expect(subject.print_menu).to eq(printed_menu)
  end

  it "returns an order with some number of several available dishes" do
    expect(order).to receive(:add).at_least(:once)
    takeaway.place_order(dishes)
  end

  it "returns the total of the order" do
    total = takeaway.place_order(dishes)
    expect(total). to eq(23.45)
    end

  it "returns a text when the order has been placed" do
    expect(text).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
