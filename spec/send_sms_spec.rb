require 'send_sms'

describe Send_sms do
  let(:message) { Send_sms.new(9.35, ["Chai"], 2) }

  it { is_expected.to respond_to(:send_message) }

  
end