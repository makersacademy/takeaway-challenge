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
      expect { customer.see_menu }.to output.to_stdout
    end
  end

  context 'place_order' do
    it { is_expected.to respond_to(:place_order).with(1).argument }
  end

end
