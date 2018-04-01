require 'twilio'

describe Message do

  it { should respond_to :send }

  subject(:message) { described_class.new }

  it "receives a confirmation text" do
    VCR.use_cassette('twilio') do
      message.send_message
    end
  end
end
