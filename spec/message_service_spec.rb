require 'message_service'

describe MessageService do

  subject(:message_service) { described_class.new }

  describe '#send_sms' do
    
    it 'sends an sms with the given text' do
      expect(message_service).to respond_to(:send_sms)
    end

  end

end
