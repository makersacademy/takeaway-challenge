require 'message'

describe Message do
  subject(:message) { described_class.new }

  describe "#send" do
    it { is_expected.to respond_to(:send) }
    it "sends a message with delivery time" do
      text_info = double :text_info
      # text_info = {
      #       :from => '12345',
      #       :to => '67890',
      #       :body => "Thank you! Your order was placed and will be delivered before #{@delivery_time}",
      #       }
      message.send
      expect(message.send).to have_received(:create).with(text_info)
    end
  end
end
