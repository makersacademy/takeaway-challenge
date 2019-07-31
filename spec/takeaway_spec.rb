require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  describe '#menu' do
    it 'exists' do
      expect(takeaway.menu).to be_a(Hash)
    end
  end

  describe '#select' do
    it 'is a method for takeaway' do
      expect(takeaway).to respond_to(:select)
    end

    it 'stores items in current_order' do
      takeaway.select("bread")
      expect(takeaway.current_order).to eq({bread: 1, apples: 0})
    end
  end
end