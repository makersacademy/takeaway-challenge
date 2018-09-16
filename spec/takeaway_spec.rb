require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(sms) }
  let(:sms) { double :sms }
  
  describe '#dishes' do
    it 'should allow dishes on the menu to be seen' do
      expect(takeaway.dishes).to be_an(Array)
    end
  end
end
