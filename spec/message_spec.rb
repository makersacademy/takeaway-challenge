require 'message'

describe Message do
  describe "#send" do
    it "should return 0 once a message is sent" do
      foo = Message.new("0","0")
      expect(foo.send("")).to eq(0)
    end
  end
end