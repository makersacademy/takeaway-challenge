require 'sendtext'

describe TwilioController do

  let(:client) { double :client }

  # subject { described_class.new(journey_c) }


  context '#send_text_message' do
    it 'sends a text' do
      # t = mock(Twilio::REST::Client)
      expect(TwilioController).to receive(:send_text_message)
      TwilioController.send_text_message
    end
  end


end
