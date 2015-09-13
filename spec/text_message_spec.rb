require 'text_message'
require 'twilio-ruby'

describe TextMessage do

  describe "#send_order_text" do
    it 'can send text message to display order information' do
      ENV = {account_sid:'double',auth_token:'double',phone_number:'double'}
      text = TextMessage.new
      order = double(:fake_order)
      allow(text).to receive(:send_order_text).and_return(nil)
      result = text.send_order_text('777777777',order)
      expect(result).to eq(nil)
    end
  end

end
