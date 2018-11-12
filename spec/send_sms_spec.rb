require 'send_sms'

describe Message do

  describe '#send_sms' do
    it { expect(subject).to respond_to :send_message }
  end

end
