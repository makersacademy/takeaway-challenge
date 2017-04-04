require "twilio"

describe Send_Message do

  it { should_not respond_to(:send_text_message).with(1).argument }

end
