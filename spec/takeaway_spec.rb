require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:menu) { { 'onion bhaji' => 3.99, 'naan' => 2.99 } }
  let(:item) { 'onion bhaji' }
  let(:single_confirmation) { "1 #{item}(s) added to your order" }
  let(:multi_confirmation) { "#{quantity} #{item}(s) added to your order" }
  let(:quantity) { 5 }
  let(:empty_basket) { [] }
  let(:order) { { item: quantity } }

  describe '#menu' do
    it 'shows a list of dishes with prices' do
      allow(takeaway).to receive(:menu) { menu }
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#basket' do
    it 'is empty when no items ordered' do
      expect(takeaway.basket).to eq empty_basket
    end
  end

  describe '#order' do
    it 'adds items to the basket' do
      takeaway.order(item, quantity)
      expect(takeaway.basket).to include order
    end

    it 'confirms an item is added to basket' do
      expect(takeaway.order(item)).to eq single_confirmation
    end

    it 'allows multiple quantities to be added' do
      expect(takeaway.order(item, quantity)).to eq multi_confirmation
    end

    it 'raises an error if item is not on menu' do
      message = 'Item is not on menu'
      expect{ takeaway.order('invalid') }.to raise_error message
    end
  end

end
