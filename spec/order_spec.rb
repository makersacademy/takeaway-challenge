require "order"

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  before do
    order.select_items("rice", 2)
  end

  it "should allow a customer to order a number of items" do
    expect(order.selection).to eq({ :rice => 2 })
  end

end
