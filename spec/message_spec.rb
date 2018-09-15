require 'message'
require 'twilio-ruby'

describe Message do
  it 'receives a text message after order is placed (using VCR)' do
    VCR.use_cassette('twilio') do
      subject.send_text('Thanks')
    end
  end

end