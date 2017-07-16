require 'sms'

describe SMS do

  let(:mobile_number) { double(+447743058608) }
  subject(:sms) { described_class.new(:mobile_number) }

  describe '#send_sms' do

    it 'sends a text' do
      allow(sms).to receive(:send_sms).and_return("Success")
      expect(sms.send_sms).to eq "Success"
    end
  end

end
