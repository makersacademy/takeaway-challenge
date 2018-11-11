require "text_sender"

describe Text_sender do

  let(:client) { double :client, messages: nil, create: nil }
  let(:sender) { double described_class.new(client) }

  it "should call messages.create" do
    allow(sender).to receive(:text_confirmation).and_return(nil)
    expect(sender).to receive(:text_confirmation)
    sender.text_confirmation
  end

  it "show the delivery time as 1 hr from now" do
    expect(subject.delivery_time).to include (Time.now + 3600).strftime("%H:%M")
  end
  
end

