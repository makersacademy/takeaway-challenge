require 'text_message'

describe TextMessage do

  describe "#send_order_text" do
    it 'can send text message to display order information' do
      KEYS = {account_sid:'double',auth_token:'double',phone_number:'double'}
      text = TextMessage.new
      order = double(:fake_order)
      allow(text).to receive(:send_order_text).and_return(nil)
      class Twilio
      end
      class Rest < Twilio
      end
      class Client < Rest
        def initialize(arg1,arg2)
        end
        def messages
        end
        def create(from:, to:, body:)
        end
      end
      result = text.send_order_text('777777777',order)
      expect(result).to eq(nil)
    end
  end

end
