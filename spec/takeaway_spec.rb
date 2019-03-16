require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:order) { double :order }
  let(:order_class) { double :order_class, new: order}
  subject(:takeaway) { Takeaway.new(menu, order_class) }

  it "should return a menu object when view_menu method is called" do
    expect(takeaway.view_menu).to eq menu
  end

  it "should return order when place_order method is called succesfully" do
    allow(order).to receive(:create_order) { order }
    expect(takeaway.place_order({ dish: dish, number: 2 }, 10)).to eq order
  end
end
