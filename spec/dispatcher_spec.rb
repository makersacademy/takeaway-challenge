require 'dispatcher'

describe Dispatcher do
  let(:order_id) {'12345'}
  let(:time) {
    t = Time.now + 360
    "#{t.hour}:#{t.min}"
  }
  let(:client) {spy :client_double, create: "Thank you! Your order 12345 was placed and will be delivered before #{time}" }


  describe '#dispatch' do
    it 'should respond to #dispatch' do
      expect(subject).to respond_to(:dispatch)
    end
    it 'should send a message containing order id and time plus 1 hour' do
      subject.instance_variable_set(:@client, client)
      expect(subject.dispatch(order_id)).to eq("Thank you! Your order 12345 was placed and will be delivered before #{time}")
    end

  end
end