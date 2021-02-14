require 'twilio_adapter'

describe TwilioAdapter do
  
  it { is_expected.to respond_to :send_message }

end
