require "text_client"

describe TextClient do
  
  let(:message_double) { double(:message_double, create: true) }
  
  subject { described_class.new }

  before(:example) do
    allow_any_instance_of(Twilio::REST::Client).to receive(:messages).and_return(message_double)
  end

  it "confirms the order has been successfully placed" do
    expect(subject.send_text).to eq "Order successfully placed!"
  end
end
