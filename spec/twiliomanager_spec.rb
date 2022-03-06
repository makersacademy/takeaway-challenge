require 'twiliomanager'

describe TwilioManager do
  subject(:twilio_manager) { TwilioManager.new }    
  
  describe '#initialize' do
    it 'sets up a new Twilio Client' do
      expect(twilio_manager.client_exists?).to be true
    end
  end

  # Removed in order not to destroy my Twilio Trial Credit
  # describe '#send_sms' do
  #   context 'returns a 34 digit SID when' do
  #     it 'successfully sends a text' do
  #       expect(twilio_manager.send_sms('hello world').size).to eq 34
  #     end
  #   end
  # end
end
