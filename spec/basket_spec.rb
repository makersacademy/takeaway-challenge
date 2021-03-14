require 'basket'

describe Basket do
  let(:basket) { Basket.new }
  let(:restaurant) { double :restaurant }
  let(:item) { double :item }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:coffee) { Item.new('Coffee', 2, 'Flat White')}

  describe '#add_to_basket' do
    it 'should be able to add items to the basket' do
      expect(basket.add_(item)).to eq [item]
    end
  end

  describe '#remove_from_basket' do
    it 'should be able to remove items from the basket' do
      basket.add_(item)
      expect(basket.remove_(0)).to eq []
    end
  end

  describe '#print_items' do
    it 'should print the basket' do
      basket.add_(item)
      allow(item).to receive(:name) { name }
      allow(item).to receive(:price) { price }
      expect(basket.print_items).to eq "#{item.name} -- £#{item.price}\n"
    end
  end

  describe '#total_price' do
    it 'should be able tot calculate the total price' do
      basket.add_(coffee)
      expect(basket.total_price).to eq "\n\nTotal: £2"
    end
  end

  describe '#print_basket' do
    it 'should be able to print the total basket' do
      basket.add_(coffee)
      expect(basket.print_basket).to eq "Coffee -- £2\n\n\nTotal: £2"
    end
  end

  describe '#empty_basket' do
    it 'should be able to empty the basket' do
      basket.add_(item)
      expect(basket.empty_basket).to eq []
    end
  end
end
