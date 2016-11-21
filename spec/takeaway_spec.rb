require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Order) }

  xit 'can display basket summary' do
    expect(takeaway.basket_summary).to eq takeaway.order.display_order
  end

  xit 'can display order sum' do
    expect(takeaway.order_price).to eq takeaway.order.order_sum
  end

  xit 'sends the confirmation text' do
    message = "Thanks, your order arrives before time. Your order: is 0, You will need to pay: 0"
    expect(takeaway).to receive(:send_text).with(message)
  end
end
