require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { {chicken: 3.99, chips: 2.99} }

  it "has a default empty order" do
    expect(takeaway.order_list).to be_empty
  end

  it "adds selected dish to order" do
    takeaway.order("chips", 2)
    expect(takeaway.order_list).to include "2x chips: 5.98"
  end

  it "raises an error when selected dish is not in menu" do
    expect { takeaway.order("wather") }.to raise_error "Wrong item selected!"
  end

end
