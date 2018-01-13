require 'cafe'

describe Cafe do

  subject(:cafe) { described_class.new }
  # let(:menu) { double :menu }

  describe 'menu retrieval' do
    it 'requests menu' do
      expect(cafe.read_menu).to eq "What would you like to order?"
    end
  end

  describe 'order' do
    it 'confirms order' do
      expect(cafe.order_me("CHIA_PUDDING")).to eq "You have ordered CHIA_PUDDING x1."
    end

    it 'states what was ordered' do
      expect(cafe.order_me("BANANA_BREAD", 2)).to eq "You have ordered BANANA_BREAD x2."
    end
  end

  describe '#checkout' do
    it 'provides a total' do
      cafe.order_me("BANANA_BREAD", 2)
      expect(cafe.checkout(11)).to eq "Please pay £11.0."
    end
    it 'checks balance at checkout' do
      cafe.order_me("BANANA_BREAD", 2)
      expect(cafe.checkout(8)).to eq "Please pay the correct amount."
    end
  end

end
