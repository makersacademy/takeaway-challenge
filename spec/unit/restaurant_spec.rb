require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe '#read_menu' do
    it 'returns a menu' do
      menu = { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
         'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
      expect(restaurant.read_menu).to eq menu
    end
  end

  describe '#order' do
    it 'stores a dish' do
      expect(restaurant.order('spring rolls')).to eq 1
    end

    it 'stores the number of dishes as an argument' do
      expect(restaurant.order('spring rolls', 3)).to eq 3
    end

    it 'can change order' do
      basket = { 'spring rolls' => 1 }
      restaurant.order('spring rolls', 3)
      expect { restaurant.order('spring rolls') }.to change { restaurant.basket }. to basket
    end
  end

  describe '#order_summary' do
    it 'returns an itemised bill' do
      restaurant.order('spring rolls')
      restaurant.order('prawn toast')
      restaurant.order('egg fried rice')
      restaurant.order('kung po chicken')
      summary = "1 x Spring rolls -- £1.99\n1 x Prawn toast -- £1.99\n" +
      "1 x Egg fried rice -- £2.5\n1 x Kung po chicken -- £4.5\nTotal is £10.98"
      expect(restaurant.order_summary).to eq summary
    end
  end

  describe '#confirm_order' do
    it 'allows messenger to send confirmation message' do
      expect(restaurant).to receive(:send_message).with("Thank you for your order.")
      restaurant.confirm_order
    end
  end
end
