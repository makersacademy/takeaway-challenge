require 'customer'
require 'restaurant'

describe Restaurant do
  context 'Can show a list of available dishes' do
    it { is_expected.to respond_to (:dishes) }
  end

  context 'Can send a confirmation text of order' do
    it { is_expected.to respond_to (:place_order) }
  end

  context 'Cannot confirm' do
    it 'an empty order' do
      customer = Customer.new
      expect { place_order(customer) }.to raise_error
    end
  end
end