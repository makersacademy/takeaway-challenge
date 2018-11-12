require "text_sender"

describe Text_sender do

  # let(:client) { double :client, messages: nil, create: nil }
  # let(:sender) { double described_class.new(client) }

  # it "should call messages.create" do
  #   allow(sender).to receive(:text_confirmation).and_return(nil)
  #   expect(sender).to receive(:text_confirmation)
  #   sender.text_confirmation
  # end

  it "show the delivery time as 1 hr from now" do
    expect(subject.delivery_time).to include (Time.now + 3600).strftime("%H:%M")
  end

 # belows are from work shop

 let(:client) { double :client}
 subject {described_class.new(client)}

  it "respond to test" do
    expect(subject).to respond_to(:text_confirmation)
  end
  
  # it "calls messages on twilio client" do
  #   expect(client).to receive(:messages).and_return(anything)
  #   subject.text_confirmation
  # end

  it "calls creates on twilio" do
    allow(client).to receive(:messages).and_return(client)
    expect(client).to receive(:create)
    subject.text_confirmation
  end

end

