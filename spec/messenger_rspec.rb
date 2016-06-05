require 'messenger'

describe Messenger do

  describe "#send"
    it "sends a message when called"
    expect(messenger.send).to eq("123")
  end

end
