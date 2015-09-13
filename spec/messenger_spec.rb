require_relative '../lib/twilio_api.rb'

describe Messenger do
  
  let(:dummy_user) { User.new { include Messenger } }

  it "can send out messages" do
    allow(dummy_user).to receive(:sendMessage).and_return("")
    dummy_user.sendMessage
  end

end