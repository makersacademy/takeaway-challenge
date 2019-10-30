require 'order'

describe Order do

  it 'sends an SMS confirmation if the total is correct' do
    mock_sms = double('sms')
    order = Order.new(mock_sms)
    order.add_to_basket("garlic bread", 5, 1)
    expect(mock_sms).to receive(:send_message)
    order.confirm_total(5)
  end

end
