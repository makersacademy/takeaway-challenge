require 'message'

describe Message do

  describe "#send" do

    it "should send a message to confirm delivery" do
      expect(subject.send).to eq false
    end

  end
end