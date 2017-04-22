require 'sms'

describe Sms do

  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }
  end
  
end
