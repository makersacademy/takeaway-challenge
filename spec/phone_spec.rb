require 'phone'

describe Phone do
  it "sends a text message when called" do
    expect(subject).to respond_to(:send_text)
  end

  it " gets info from environment variables" do
    subject.send_text
    expect(subject.account_sid).to be_nil
    expect(subject.auth_token).to be_nil
    expect(subject.sender_no).to be_nil
    expect(subject.receiver_no).to be_nil
  end
end
