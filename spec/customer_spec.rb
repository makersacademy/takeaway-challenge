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

end
