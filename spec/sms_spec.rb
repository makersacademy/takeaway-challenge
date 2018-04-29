require 'sms'

describe SMS do

  let(:sms) { subject }
  let(:hour_from_now) { "11.17" }
  let(:twilio_messenger) { Twilio::REST::Api::V2010::AccountContext::MessageList }
  let(:text_message) { "  Your order was placed and will be delivered before #{hour_from_now}" }

  describe ' #send ' do
    it "should send an SMS" do
      expect_any_instance_of(twilio_messenger).to receive(:create).and_return(text_message)
      expect(sms.send).to eq(text_message)
    end
  end
end
