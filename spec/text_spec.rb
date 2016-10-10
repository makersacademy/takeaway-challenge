require 'text'

describe Text do
  subject(:text) { described_class.new("Order confirmed", credentials) }
  let(:credentials) { double("credentials", :acc_sid => ENV['ACCOUNT_SID_TEST'],
                     :auth_token => ENV['AUTH_TOKEN_TEST'], :sender => ENV['SENDER_NUMBER_TEST']) }

  it "has a sender's number" do
    expect(text.to).not_to be nil
  end

  it "has a receiving number" do
    expect(text.from).not_to be nil
  end

  it "has a message" do
    expect(text.message).not_to be nil
  end

  it "can be sent" do
    expect(text.send_text).to be_truthy
  end
end
