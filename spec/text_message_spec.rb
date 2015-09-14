require 'text_message'

describe TextMessage do

  describe "#send_order_text" do
    it 'can send text message to display order information' do
      KEYS = {account_sid:'double',auth_token:'double',phone_number:'double'}
      text = TextMessage.new
      order = double(:fake_order)
      allow(order).to receive(:display_order).and_return('order details')
      module Twilio
      end
      module Twilio::REST
      end
      class Twilio::REST::Client
        def initialize(arg1,arg2)
        end
        def messages
          self
        end
        def create(from: 'anyone', to: 'anything', body: 'not_empty')
        end
      end
      result = text.send_order_text('777777777',order)
      expect(result).to eq('Text sent!')
    end
  end

end
