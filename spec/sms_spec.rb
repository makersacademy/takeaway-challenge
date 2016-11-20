require "sms"

describe SMS do
  subject(:sms) {described_class.new}
  it "should send a message to 07414991997" do
    expect(sms).to receive(:text_message).with
    expect(sms.text_message("This is your first message")).to eq "This is your first message."
  end
end
