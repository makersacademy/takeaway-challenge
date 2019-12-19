require 'messenger'

describe Messenger do

  subject(:messenger) { Messenger.new(client) }
  let(:client) { double :client }
  let(:time) { double :time }

  describe "send_text(customer_number, time)" do
    it "sends a text message" do
      allow(client).to receive_message_chain(:messages, :create) { "text sent" }
      allow(time).to receive(:strftime)
      expect(subject.send_text("000 333", time)).to eq "text sent"
    end
  end

end
