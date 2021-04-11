require 'text'

describe Text do
  
  it { is_expected.to be_an_instance_of Text }

  it { is_expected.to respond_to(:send_sms).with(1).argument }
  
end
