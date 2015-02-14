require 'customer'

  describe Customer do 

    it 'has a basket' do
      customer = Customer.new
      expect(customer.basket).to eq []
    end
  end
