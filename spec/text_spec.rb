require "text"

describe Text do
  let(:phone_number) { "07854692794" }
  let(:client) { double(:client) }
  subject(:text) { described_class.new(phone_number) }

  describe "initialization" do
    it "should receive a phone number at initialization" do
      expect(text.number).to eq phone_number
    end
  end

  describe "#send" do
    before do
      allow(client).to receive_message_chain(:messages, :create)
    end
    it "should send a text to the user's number" do

    end
  end
end
