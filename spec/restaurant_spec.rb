describe Restaurant do
  subject(:restaurant) { described_class.new }

  before do
    allow(restaurant).to receive(:send_text)
  end

  it 'sends a payment confirmation text message' do
    expect(restaurant).to receive(:send_text).with("Thank you for your order: £20.93")
    restaurant.complete_order(20.93)
  end
  
end
