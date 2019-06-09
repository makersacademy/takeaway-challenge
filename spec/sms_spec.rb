require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client: client) }

  let(:client) {double(:client) }
  
  it "delivers an SMS with the estimated time" do
    sms.deliver
  end
end
