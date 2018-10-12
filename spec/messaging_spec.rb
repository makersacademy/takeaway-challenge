require 'messaging'
# require 'twilio-ruby'

describe 'Messaging' do
  describe 'construct message' do
    it 'print message correctly' do
      message = Messaging.new
      expect(message.message).to eq "Thank you!"
    end
  end
end
