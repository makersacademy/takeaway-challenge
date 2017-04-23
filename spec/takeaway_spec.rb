require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :check_basket }
  it { is_expected.to respond_to :view_menu }
  it { is_expected.to respond_to :add }

  describe '#check_basket' do
    it 'starts as an empty basket' do
      expect(takeaway.check_basket).to be_empty
    end
  end

  describe '#total' do
    it 'starts as a total of zero' do
      expect(takeaway.total).to eq '£0.00'
    end
  end

  describe '#view_menu' do
    it 'displays the food on the menu' do
      expect(takeaway.view_menu).to eq Menu::FOOD_MENU
    end
  end

  describe '#add' do
    it 'raises error when item is not on the menu' do
      msg = 'Rice is not on the menu. Why not try our delicious Cleanout curry?'
      expect { takeaway.add('Rice') }.to raise_error msg
    end

    it 'adds valid items to basket' do
      takeaway.add('Cleanout curry')
      order_hash = [{ item: 'Cleanout curry', amount: 1, price: 1.99 }]
      expect(takeaway.check_basket).to eq order_hash
    end

    it 'adds the specified quantity' do
      takeaway.add('Cleanout curry', 3)
      order_hash = [{ item: 'Cleanout curry', amount: 3, price: 5.97 }]
      expect(takeaway.check_basket).to eq order_hash
    end
  end
end
