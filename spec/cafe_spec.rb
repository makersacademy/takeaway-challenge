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

    it 'raises error if item not listed' do
      expect { cafe.order_me("cereal") }.to raise_error('This item is not on the menu.')
    end

    it 'states what was ordered' do
      expect(cafe.order_me("BANANA_BREAD", 2)).to eq "You have ordered BANANA_BREAD x2."
    end
  end

  describe '#checkout' do
    it 'provides a total' do
      cafe.order_me("BANANA_BREAD", 2)
      expect(cafe.checkout(11)).to eq "Thank you for £11.0."
    end
    it 'checks balance at checkout' do
      cafe.order_me("BANANA_BREAD", 2)
      expect{ (cafe.checkout(8)) }.to raise_error "Please pay the correct amount of £11.0."
    end
  end

  # describe '#confirm_order' do
  #   it 'sends a text' do
  #     cafe.order_me("BANANA_BREAD", 2)
  #     expect(cafe.checkout(8)).to "
  #   end
  # end



end
