require 'text'

describe Text do

  let(:text){instance_double("Text")}

  describe "#send_message" do
    it "sends a confirmation text" do
      allow(text).to receive(:send_message)
      allow(text).to receive(:generate_message)
      expect(text.send_message).to eq(@message)
    end
    xit "has a default value of zero" do
      allow(text).to receive(:send_message)
      allow(text).to receive(:message)
      allow(text).to receive(:generate_message)
      text.send_message(0)
      expect(text.message).to include(0)
    end
  end
end
