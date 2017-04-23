require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :check_basket }
  it { is_expected.to respond_to :view_menu }
  it { is_expected.to respond_to :add }

  let(:text) { double :sms, send_message: 'Order confirmed' }

  describe '#check_basket' do
    it 'starts as an empty basket' do
      expect(takeaway.check_basket).to be_empty
    end
  end

  describe '#check_total' do
    it 'starts as a total of zero' do
      expect(takeaway.check_total).to eq 'Basket total: £0.00'
    end

    it 'adds items to the total price' do
      takeaway.add('Cleanout curry') # Price is 1.99
      expect(takeaway.check_total).to eq 'Basket total: £1.99'
    end

    it 'adds multiple items together' do
      takeaway.add('Cleanout curry') # Price is 1.99
      takeaway.add('Chicken korma') # Price is 5.99
      expect(takeaway.check_total).to eq 'Basket total: £7.98'
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

  describe '#basket_summary' do
    it 'displays items and total due together' do
      takeaway.add('Mystery stew', 1)
      final_basket = [takeaway.check_basket, takeaway.check_total]
      expect(takeaway.basket_summary).to eq final_basket
    end
  end

  describe '#checkout' do
    it 'raises error when given incorrect payment total' do
      takeaway.add('Cleanout curry') # Price is 1.99
      expect { takeaway.checkout(2.00) }.to raise_error 'Incorrect total'
    end

    it 'sends through to text message class' do
      takeaway.send(:text=, text)
      takeaway.add('Cleanout curry')
      expect(takeaway.checkout(1.99)).to eq 'Order confirmed'
    end
  end
end
