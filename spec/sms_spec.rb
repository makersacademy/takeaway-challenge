require 'sms'

describe SMS do

  subject(:sms) { described_class.new(config) }
  let(:client) { double(:client, messages: messages)}
  let(:messages) { double(:messages) }

  let(:config) do {
      account_sid: "111",
      auth_token: "222",
      from: "+333",
      to: "+444",
      body: "Thank you, loyal customer! Your order has been successfully placed.\nEstimated Delivery Time: #{Time.now + (60*60)}"
    }
  end

  it 'sends an SMS to confirm the order' do
    # sms.send
  end

end
