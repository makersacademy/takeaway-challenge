require 'customer'

describe Customer do

  let(:phone_number) { ENV['CUSTOMER_NUMBER'] }
  let(:pizza) { double :pizza, price: 10.50 }
  let(:menu) { double :menu }
  let(:order) { double :order }

  subject(:customer) { described_class.new(phone_number, menu, order) }

  # I would like to see a list of dishes with prices
  describe '.show_menu' do
    it { is_expected.to respond_to :show_menu }
    it 'calls display method in menu class' do
      expect(menu).to receive(:display)
      customer.show_menu
    end
  end

  describe '.show_order' do
    it { is_expected.to respond_to :show_order }
    it 'calls display method in order class' do
      expect(order).to receive(:display)
      customer.show_order
    end
    # Need a test in here to check total
  end

  describe '.select_dish' do
    it { is_expected.to respond_to(:select_dish).with(2).arguments }
    it 'calls add method in order class' do
      expect(order).to receive(:add).with(pizza, 2)
      customer.select_dish(pizza, 2)
    end
  end

  # describe '.remove_dish' do
  #   it { is_expected.to respond_to(:remove_dish).with(2).arguments }
  #   it 'calls remove method in order class' do
  #     expect(order).to receive(:remove).with(1, 2)
  #     customer.select_dish(1, 2)
  #   end
  # end

  describe '.place_order' do
    it { is_expected.to respond_to(:place_order) }
    it 'calls confirmed method in order class' do
      expect(order).to receive(:confirmed)
      customer.place_order
    end
  end
end
