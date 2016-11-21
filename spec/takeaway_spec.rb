require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Order) }

  xit 'can display basket summary' do
    expect(takeaway.basket_summary).to eq takeaway.order.display_order
  end

  xit 'can display order sum' do
    expect(takeaway.order_price).to eq takeaway.order.order_sum
  end
end
