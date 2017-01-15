require "phone"
describe Phone do
  describe "#send_confirmation_text" do
    it "sends a text" do
      client = subject.instance_variable_get(:@client)
      allow(client.account.messages).to receive(:create)
      time = (Time.new + (60*60)).strftime("%H:%M")
      text = "cheers! your food will be with you by #{time}"
      expect(subject.send_confirmation_text).to eq text
    end
  end
end
