require 'message'
describe Message do

  describe '#send_message' do
    it 'sends a message' do
      #set up
      client = double('client')
      client_messages = double('client_messages')
      info = { :body=>"Thank you! Your order will be delivered before #{(Time.now + 3600).strftime('%H:%M')}",
              :from=>nil, :to=>nil }

      allow(client).to receive(:messages).and_return(client_messages)
      allow(client_messages).to receive(:create).with(info).and_return('WE MADE IT')
      message = Message.new(client)
      expect(message.send_message).to eq 'WE MADE IT'
    end
  end

  # describe 'delivery time' do
  #   it 'returns the delivery time, 1 hour from now' do
  #     fake_time = Time.parse("19:30")
  #     allow(Time).to receive(:now) { fake_time }
  #     expect(subject.delivery_time).to eq '20:30'
  #   end
  # end

end  
        # expect(client).to receive(:messages).and_return(client_messages)
        # expect(client_messages).to receive(:create).with(info)

        # message = Message.new(client)

  
  
