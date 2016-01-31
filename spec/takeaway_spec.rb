require 'takeaway'

TEST_PRICE = 1.99
TEST_QUANTITY = 3

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, sms_handler) }
  let(:menu) { double(:menu, list: {}, price: TEST_PRICE) }
  let(:sms_handler) { double(:sms_handler) }

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
    it 'gets the price from the menu' do
      expect(menu).to receive(:price)
      takeaway.order('item')
    end

    it 'adds item to basket' do
      takeaway.order('item')
      expect(takeaway.basket).to include 'item'
    end

    it 'increases quantity to existing item to basket' do
      TEST_QUANTITY.times { takeaway.order('item') }
      expect(takeaway.basket['item']).to include TEST_QUANTITY
    end

    it 'adds specific quantity of item to basket when specified' do
      takeaway.order('item', TEST_QUANTITY)
      expect(takeaway.basket['item']).to include TEST_QUANTITY
    end
  end

  describe '#bill' do
    it 'returns the calculated bill' do
      total = TEST_PRICE * TEST_QUANTITY
      takeaway.order('item', TEST_QUANTITY)
      expect(takeaway.bill).to eq total
    end
  end

  describe '#checkout' do
    it 'raises error if basket is empty on checkout' do
      message = 'Basket is empty!'
      expect { takeaway.checkout(0) }.to raise_error(message)
    end

    it 'raises error if estimated and actual total is not matching' do
      takeaway.order('item', TEST_QUANTITY)
      wrong_total = TEST_PRICE * TEST_QUANTITY + rand
      message = 'Incorrect estimated total!'
      expect { takeaway.checkout(wrong_total) }.to raise_error(message)
    end

    it 'calls send on sms_handler' do
      takeaway.order('item')
      expect(sms_handler).to receive(:send)
      takeaway.checkout(TEST_PRICE)
    end
  end
end

# TODO: quantity less than 1?
# TODO: remove item method?
