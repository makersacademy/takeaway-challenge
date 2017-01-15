require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Order) }

  xit 'can show basket items' do
    expect(takeaway.basket).to eq takeaway.order.view_order
  end

  it 'can display order total price' do
    expect(takeaway.order_total).to eq takeaway.order.view_order # fails on empty array of takeaway.order.view_order compared to '0.00' of takeaway.order_total
  end

  xit 'sends a text message confirming the order' do
    message = "Thank you! Your order was placed and will be delivered before #{takeaway.time}"
    expect(takeaway).to receive(:confirmation_text).with(message)
  end
end
