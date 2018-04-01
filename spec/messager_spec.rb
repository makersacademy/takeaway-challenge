require 'messager'

describe Messager do
  subject(:messager) { described_class.new }

  it "receives a confirmation text" do
    VCR.use_cassette('twilio') do
      messager.send_text(15.75)
    end
  end
end
