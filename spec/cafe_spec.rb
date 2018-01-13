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
      expect(cafe.order_me("CHIA_PUDDING")).to eq "You have ordered CHIA_PUDDING."
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

end
