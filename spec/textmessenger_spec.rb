require 'textmessenger'

describe TextMessenger do

  context "#send_text" do

    it "sends a confirmation text" do
      expect(described_class).to respond_to(:send_text)
    end
  end
end
