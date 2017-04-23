require 'sms'
require 'hour'

describe Sms do

  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }

    # it 'should send a text notification' do
    #   order = Order.new.place_order
    #   message = "Thank you! Your order was placed and will be delivered before #{Hour.new.eta_to_string}"
    #   allow_any_instance_of(order).to receive(:send_message).with(message)
    #   expect(order).to eq message
    # end
  end

end
