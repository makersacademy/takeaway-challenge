require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:item) { 'onion bhaji' }
  let(:item_confirmation) { "#{item} was added to your order" }
  let(:empty_basket) { [] }
  let(:order) { [] }
  let(:menu) { {'onion bhaji' => 3.50, 'chicken dhansak' => 7.95, 'lamb jalfrezi' => 8.95} }

  describe '#menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#basket' do
    it 'is empty when no items ordered' do
      expect(takeaway.basket).to eq empty_basket
    end
  end

  describe '#order' do
    it 'confirms an item is added to basket' do
      expect(takeaway.order(item)).to eq item_confirmation
    end
  end

end
