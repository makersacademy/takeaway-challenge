require 'takeaway'

TEST_PRICE = 1.99

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, list: { 'fries' => TEST_PRICE }) }

  describe '#basket' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#show_menu' do
    it 'calls list method on menu' do
      expect(menu).to receive(:list)
      takeaway.show_menu
    end
  end

  describe '#order' do
    it 'raises error if item is not in menu' do
      message = 'Item not in menu!'
      expect { takeaway.order('chicken') }.to raise_error(message)
    end

    it 'adds item to basket' do
      takeaway.order('fries')
      expect(takeaway.basket).to include 'fries'
    end

    it 'increases quantity to existing item to basket' do
      quantity = 2
      quantity.times { takeaway.order('fries') }
      expect(takeaway.basket['fries']).to eq quantity
    end

    it 'adds specific quantity of item to basket' do
      quantity = 3
      takeaway.order('fries', quantity)
      expect(takeaway.basket['fries']).to eq quantity
    end
  end

  # TODO: quantity less than 1?
  # TODO: remove item method?

  describe '#bill' do
    it 'returns the calculated bill' do
      quantity = 2
      total = TEST_PRICE * quantity
      takeaway.order('fries', quantity)
      expect(takeaway.bill).to eq total
    end
  end

  # describe '#checkout' do
    # it 'raises error if estimated and actual total is not matching' do
    #   expect { takeaway.checkout }
    # end
  # end
end
