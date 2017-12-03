require_relative "../lib/order.rb"

describe Order do
  subject(:order) {described_class.new}

  it "should add a dish to the current order" do
    expect(subject.add_to_order(:item)).to change{order.length}.by 1
  end

end
