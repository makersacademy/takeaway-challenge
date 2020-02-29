require 'customer'

describe Customer do

  # let(:pizza) { double :pizza, price: 10.50 }
  # let(:curry) { double :curry, price: 8.00 }
  # let(:burger) { double :curry, price: 6.50 }

  let(:menu) { double :menu }
  let(:order) { double :order }

  subject(:customer) { described_class.new(menu, order) }
  # dishes: [pizza, curry, burger]

  # I would like to see a list of dishes with prices
  describe '.show_menu' do
    it { is_expected.to respond_to :show_menu }
    it '#calls display method in menu class' do
      expect(menu).to receive(:display)
      customer.show_menu
    end
  end

  describe '.show_order' do
    it { is_expected.to respond_to :show_order }
    it '#calls display method in order class' do
      expect(order).to receive(:display)
      customer.show_order
    end
  end

end
