# frozen_literial_string: true

require 'twilio_client'

RSpec.describe TwilioClient do
  let(:client) { described_class.new }
  let(:message_info) { File.open('fixtures/twilio_response.json').read }

  describe '#send_text' do
    it 'sends a post request with message and number to twilio api' do
      stub = api_stub
      client.send_text('18:52')

      expect(stub).to have_been_requested
    end

    it 'returns status' do
      api_stub

      status = client.send_text('18:52')

      expect(status).to eq 'accepted'
    end
  end

  def api_stub(status = 201)
    api_url = "https://api.twilio.com/2010-04-01/Accounts/account_sid/Messages.json"

    stub = stub_request(:post, api_url)
           .with(body: send_request)
           .to_return(status: status, body: message_info)
  end

  def send_request
    {
      "Body" => "Thank you! Your order was placed and will be delivered before 18:52",
      "MessagingServiceSid" => "messaging_service_sid",
      "To" => "receiver_number"
    }
  end
end
