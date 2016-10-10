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

  describe "stub api" do
    xit 'returns text message' do
      client = double('client', :to => 'to', :from => 'from', :body => 'body')
      # allow(client).to receive(send_message).and_return(message)
      response = Message.new(client).get_message
      expect(response).to eq message
    end
  end
end
