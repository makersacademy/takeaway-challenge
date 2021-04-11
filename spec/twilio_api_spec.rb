require 'twilio_api'

describe TwilioApi do
  
  it { is_expected.to respond_to :message }

end
