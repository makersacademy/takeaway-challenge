require 'message'

describe Message do

  it "sends an sms with time of arrival" do
    expect(subject).to respond_to :sender
  end
end
