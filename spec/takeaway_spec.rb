require 'takeaway'

describe Order do

  describe '#initialize' do
    it 'takes an empty basket array of key-value pairs' do
      expect(subject.initialize).to be_nil
    end

  end
  describe '#add_items' do
    it 'adds food requests to basket array' do
      expect(subject.add_items).to_not be_nil
    end
  end
end

#
# describe Station do
#   subject { described_class.new('Bank') }
#
#   describe '#initialize' do
#     it 'has a station name' do
#       expect(subject.name).to eq 'Bank'
#     end
#
#     it 'has a zone' do
#       expect(subject.zone).to eq '1'
#     end
#   end
# end
# # write mock to call pretend number via Twilio
