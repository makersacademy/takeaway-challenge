require 'sms'

describe Sms do
  subject(:sms) { described_class.new }
  let(:time) { double :time }

  describe '#delivery_time' do
    it 'calculates an hour extra' do
      allow(Time).to receive(:now).and_return(Time.parse("16:20"))
      expect(sms.delivery_time).to eq "17:20"
    end
  end
end
