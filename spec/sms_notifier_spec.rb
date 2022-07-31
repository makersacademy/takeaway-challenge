require "sms_notifier.rb"

describe Sms_notifier do
  it "sends message to notify the user" do
    expect(subject).to respond_to(:send_message)
  end
end
