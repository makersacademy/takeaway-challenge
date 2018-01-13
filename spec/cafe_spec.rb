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

    it 'matches customer total' do
      cafe.order_me("BANANA_BREAD", 3)
      expect(cafe.total_correct?(16.50)).to eq "Your total is correct."
    end

    it 'does not match customer total' do
      cafe.order_me("BANANA_BREAD", 3)
      expect(cafe.total_correct?(1.50)).to eq "Your total is incorrect."
    end
  end

  describe '#checkout' do
    it 'provides a total' do
      cafe.order_me("BANANA_BREAD", 2)
      expect(cafe.checkout).to eq "Please pay £11.0."
    end
  end

end
