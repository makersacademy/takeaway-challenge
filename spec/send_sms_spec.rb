require 'send_sms'

describe Send_sms do

  subject(:send_sms) { described_class.new }

  describe '#send_text_message' do
    it 'sends a text confirming the order' do
      order = double(:order, total: 20.50)
      allow(send_sms).to receive(:send_text_message).and_return("Total price: #{order.total}. Order confirmed! Your food will be delivered at #{Time.now + 3600}!")
      expect(send_sms.send_text_message).to eq "Total price: #{20.50.to_i}. Order confirmed! Your food will be delivered at #{Time.now + 3600}!"
    end
  end

end
