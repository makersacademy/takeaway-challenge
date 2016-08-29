require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:order_confirmation) {double :order_confirmation}
  let(:text) {double :text}

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'shows a list of available dishes' do
    expect(takeaway.show_menu).to include({"chips" => 2})
  end

  it 'raises an error if a dish is not available' do
    msg = 'That dish is not available'
    expect{takeaway.add("rice",2)}.to raise_error msg
  end

  it 'adds dishes to selected dishes' do
    takeaway.add("chips",2)
    msg = "Your selected dishes are {\"chips\"=>2}"
    expect(takeaway.view_order).to eq msg
  end

  it 'shows the total price of the order' do
  takeaway.add("chips",2)
  takeaway.add("burger",2)
  msg = "Your total order price is £14"
  expect(takeaway.order_price).to eq msg

  end

  it 'confirms the order price' do
    takeaway.add("chips", 2)
    expect(takeaway.amount?(4)).to eq true
  end

  it 'sends a text once confirming the order' do
    allow(:send_text).to receive(:delivery_time)
    takeaway.add("chips",2)
    takeaway.add("burger",2)
    expect(takeaway).to receive(:send_text).with(msg)
    msg = "Thank you! Your order was placed and
           will be delivered at #{delivery_time}"
    takeaway.order_confirmation
  end
end
