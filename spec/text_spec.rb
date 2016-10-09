require 'text'

describe Text do
  subject(:text){described_class.new("Order confirmed", credentials)}
  let(:credentials) {double("credentials", :acc_sid => 'AC7323b7093be74631798dd01275d5a5eb', :auth_token => '60f9f1ff1becf749a8a43fb305fed625', :sender => '+15005550006')}

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
