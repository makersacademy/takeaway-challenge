require "message"

describe Message do
  context "responds to method" do
    it "#send" do
      expect(subject).to respond_to(:sending)
    end
  end
end