require 'order'

describe Order do
  subject(:order) { described_class.new}

  let(:list) do
    {
      "Chop Suey" => 15.99,
      "Thai Curry" => 11.99,
      "Singapore Noodles" => 9.99
    }
  end

  it 'is initialized with an empty order' do
    expect(order.current).to eq({})
  end

  it 'returns the order total' do
    order.current["Chop Suey"] = 15.99
    order.current["Thai Curry"] = 11.99
    expect(order.total).to eq 27.98
  end

  it 'displays the order and the cost' do
    expect(order.summary).to eq "Thanks! Your order, total £#{order.total}, will be delivered by #{order.delivery_time}!"
  end

  describe 'confirmation' do
    it{ is_expected.to respond_to :sms_confirmation}

  end

end
