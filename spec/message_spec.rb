require 'message'


describe Message do

  subject(:message){described_class.new(:to, :from, :body)}

  describe "#send_message" do
    it 'has number to send to' do
      expect(message.to).to eq :to
    end

    it 'has a number to text from' do
      expect(message.from).to eq :from
    end

    it 'has a default message' do
      expect(message.body).to eq :body
    end
  end
end
