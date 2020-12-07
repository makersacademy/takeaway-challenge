require 'message_sender'

describe MessageSender do

  describe '#initialize' do
    it "returns an instance of the MessageSender class" do
      expect(subject).to be_an_instance_of MessageSender
    end 
  end

end
