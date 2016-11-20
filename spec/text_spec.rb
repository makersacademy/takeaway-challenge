require 'text'

describe Text do
  subject(:text) {described_class.new}

  it "creates a confirmation message" do
    expect(text.message).to eq "Your order will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"
  end

  it "sends a confirmation text" do

  end

end
