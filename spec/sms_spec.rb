require 'sms'

describe SMS do

  it "Responds to #confirmation_text" do
    expect(subject).to respond_to(:confirmation_text)
  end

end