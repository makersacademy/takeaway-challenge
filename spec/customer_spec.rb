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

  context 'place_order' do
    it { is_expected.to respond_to(:place_order).with(1).argument }
  end

  context 'see_order' do
    it 'prints order upon request' do
      customer.see_menu
      # write proper test later on
      order_hash = { 1 => 3, 6 => 2, 9 => 1}
      customer.place_order(order_hash)
      expect { customer.see_order }.to output.to_stdout
    end
  end

end
