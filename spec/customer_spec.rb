require 'customer'

describe Customer do

  subject(:customer) { described_class.new }

  context 'class' do
    it 'creates instance of a class' do
      expect(customer).to be_a(Customer)
    end
  end

  context 'see_menu' do
    it 'prints menu upon request' do
      # replace with doubles
      expect { customer.see_menu }.to output.to_stdout
    end
  end

  context 'place_order_interface' do
    it { is_expected.to respond_to(:place_order_interface).with(0).arguments}
  end

  context 'place_order' do
    let(:order_hash) { double :order_hash }
    it { is_expected.to respond_to(:place_order).with(1).argument }
    it 'saves an order' do
      # Figure out how to test!
      # (customer.order).stub(:total) { "total" }
      # expect(customer.order).to eq("total")
    end
    it 'raises an error if menu hasn\'t been loaded' do
      message = "Can't place order without information about the order: please provide what you would like to order in acceptable format."
      expect {customer.place_order(nil)}.to raise_error(message)
    end
  end

  context 'see_order' do
    it 'prints order upon request' do
      customer.see_menu
      # write proper test later on
      order_hash = { 1 => 3, 6 => 2, 9 => 1}
      customer.place_order(order_hash)
      expect { customer.see_order }.to output.to_stdout
    end
    it 'raises an error if order was not ordered' do
      message = "Order can't be found: looks like it hasn't been placed yet. Please place the order first."
      expect {customer.see_order}.to raise_error(message)
    end
  end

end
