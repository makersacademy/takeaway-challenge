require 'textmessage'

context TextMessage do
  
  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }
  end

end
