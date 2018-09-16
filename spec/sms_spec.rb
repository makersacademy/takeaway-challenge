require 'sms'

describe SMS do
  subject(:sms) { described_class.new }
  describe '#send_sms' do
    xit 'should send an sms test message' do
      sms.send()
    end
  end
end
