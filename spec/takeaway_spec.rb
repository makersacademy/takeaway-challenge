require 'takeaway'

TEST_PRICE = 1.99
TEST_QUANTITY = 3

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
      TEST_QUANTITY.times { takeaway.order('fries') }
      expect(takeaway.basket['fries']).to include TEST_QUANTITY
    end

    it 'adds specific quantity of item to basket when specified' do
      takeaway.order('fries', TEST_QUANTITY)
      expect(takeaway.basket['fries']).to include TEST_QUANTITY
    end
  end

  # TODO: quantity less than 1?
  # TODO: remove item method?
  # TODO: error on checkout if basket empty
  # TODO: round?

  describe '#bill' do
    it 'returns the calculated bill' do
      total = TEST_PRICE * TEST_QUANTITY
      takeaway.order('fries', TEST_QUANTITY)
      expect(takeaway.bill).to eq total
    end
  end

  describe '#checkout' do
    it 'raises error if estimated and actual total is not matching' do
      takeaway.order('fries', TEST_QUANTITY)
      wrong_total = TEST_PRICE * TEST_QUANTITY + rand
      message = 'Incorrect estimated total!'
      expect { takeaway.checkout(wrong_total) }.to raise_error(message)
    end
  end
end
