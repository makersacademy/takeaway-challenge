require 'texter'

describe Texter do
  let(:client_class) { double(:client_class, new: client) }
  let (:client) { double(:client) }
  let(:messages) { double(:messages, create: nil) }
  let (:time) { double(:Time_class) }
  subject { described_class.new("01","01", "01234987654", client_class, time) }
  before do
      allow(client).to receive_message_chain(:api, :account, :messages).and_return messages
      allow(time).to receive_message_chain(:now, :+, :strftime).and_return "12:00"
  end
  describe "#text" do
    it "creates a text message for the customer" do
      expect(messages).to receive(:create).with({:from => "01234987654", :to => "09876543210", :body => "Thank you! Your order was placed and will be delivered before 12:00."})
      subject.text("09876543210")
    end
  end
end
