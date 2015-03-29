require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'take_away_order'

describe TakeAwayOrder do
  it "has no items when created" do
    order = described_class.new
    expect(order.items).to be_empty
  end

  it "has an order-placed status when created" do
    order = described_class.new
    expect(order.order_placed?).to eq false
  end

  xit "has an order total of 0 when created"
  # order = described_class.new
  # expect(items.total).to eq 0
  # end
end
