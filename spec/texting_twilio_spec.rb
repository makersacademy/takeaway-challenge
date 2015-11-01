require 'texting_twilio'

describe TextingTwilio do

  it 'gets a response' do
    VCR.use_cassette('twilio_send_text') do
      response = TextingTwilio.send_text
      expect(response.body).to include('Thank you! Your order has been placed and delivery is scheduled for')
    end
  end

end