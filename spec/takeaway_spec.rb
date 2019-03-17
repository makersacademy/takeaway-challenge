require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order) }
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:dishes) { { curry: 6, rice: 5, burger: 4, chips: 2, wings: 5 } }

  it "selects a number of dishes to order" do
    5.times { expect(order).to receive(:add) }
    takeaway.place_order(dishes)
  end
end
