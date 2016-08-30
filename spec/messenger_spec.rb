require 'messenger'

describe Messenger do

  describe "#send_message" do
    it "should return a new message string" do
      expect(subject.send_message.to include("the total of the order is £"))
    end
  end
end
