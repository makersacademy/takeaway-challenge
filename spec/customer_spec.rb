require 'customer'

describe Customer do

  subject(:customer) { described_class.new }

  context 'class' do
    it 'creates instance of a class' do
      expect(customer).to be_a(Customer)
    end
  end

  context 'see_menu' do
    it 'can request to see a menu' do
      is_expected.to respond_to(:see_menu).with(1).argument
    end    
  end

end
