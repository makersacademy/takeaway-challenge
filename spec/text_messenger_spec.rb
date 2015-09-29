require 'text_messenger'

describe TextMessenger do

  describe "#send_order_text" do
    it 'can send text message to display order information' do
      ENV = {account_sid:'double',auth_token:'double',phone_number:'double'}
      text_messenger = TextMessenger.new
      order = double(:fake_order)
      allow(order).to receive(:display_order_on_sms).and_return('order details')
      client = double(:client)
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).and_return(client)
      text_sent_confirmation = text_messenger.send_order_text('777777777',order)
      expect(text_sent_confirmation).to eq('Text sent!')
    end
  end

end
